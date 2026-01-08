using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;

public class VictoryScreenManager : MonoBehaviour
{
    [Header("UI元素引用")]
    [SerializeField] private GameObject victoryScreen; // 整个通关界面
    [SerializeField] private Image darkOverlay;        // 变暗背景
    [SerializeField] private TMP_Text victoryText;    // 通关文字
    [SerializeField] private Button menuButton;       // 返回主菜单按钮
    [SerializeField] private GameObject buttonPanel;  // 按钮面板（可选）

    [Header("动画效果")]
    [SerializeField] private float fadeInTime = 1f;      // 淡入时间
    [SerializeField] private float textShowDelay = 0.5f; // 文字显示延迟
    [SerializeField] private float buttonShowDelay = 1f; // 按钮显示延迟

    [Header("场景设置")]
    [SerializeField] private string mainMenuScene = "MainMenu"; // 主菜单场景名称
    [SerializeField] private int gameSceneIndex = 1;            // 游戏场景索引

    [Header("通关设置")]
    [SerializeField] private string victoryCrystalTag = "VictoryCrystal"; // 通关水晶标签

    private CanvasGroup canvasGroup;
    private bool isVictoryScreenActive = false;
    private bool hasWon = false; // 防止重复触发

    void Awake()
    {
        Debug.Log($"=== VictoryScreenManager Awake开始 ===");

        // 自动查找UI元素（如果没手动指定）
        AutoFindUIElements();

        // 初始化UI（隐藏子物体，但保持Canvas激活）
        InitializeUI();

        Debug.Log("=== VictoryScreenManager Awake完成 ===");
    }

    void AutoFindUIElements()
    {
        Debug.Log("开始自动查找UI元素...");

        // 如果Inspector中没有指定，自动查找
        if (victoryScreen == null)
        {
            victoryScreen = GameObject.Find("VictoryCanvas");
            Debug.Log($"查找VictoryCanvas: {(victoryScreen != null ? "找到" : "未找到")}");
        }

        if (victoryScreen != null)
        {
            Debug.Log($"找到VictoryCanvas: {victoryScreen.name}, 激活状态: {victoryScreen.activeSelf}");

            // 查找DarkOverlay
            if (darkOverlay == null)
            {
                darkOverlay = victoryScreen.transform.Find("DarkOverlay")?.GetComponent<Image>();
                Debug.Log($"找到darkOverlay: {(darkOverlay != null ? "成功" : "失败")}");
            }

            // 查找VictoryText
            if (victoryText == null)
            {
                victoryText = victoryScreen.transform.Find("VictoryText")?.GetComponent<TMP_Text>();
                Debug.Log($"找到victoryText: {(victoryText != null ? "成功" : "失败")}");
            }

            // 查找ButtonPanel
            if (buttonPanel == null)
            {
                buttonPanel = victoryScreen.transform.Find("ButtonPanel")?.gameObject;
                Debug.Log($"找到buttonPanel: {(buttonPanel != null ? "成功" : "失败")}");
            }

            // 查找按钮（可能在ButtonPanel下）
            if (menuButton == null)
            {
                // 先在ButtonPanel下查找
                if (buttonPanel != null)
                {
                    menuButton = buttonPanel.transform.Find("MenuButton")?.GetComponent<Button>();
                }

                // 如果没找到，直接在VictoryCanvas下查找
                if (menuButton == null)
                {
                    menuButton = victoryScreen.transform.Find("MenuButton")?.GetComponent<Button>();
                }
                Debug.Log($"找到menuButton: {(menuButton != null ? "成功" : "失败")}");
            }
        }
        else
        {
            Debug.LogError("未找到VictoryCanvas！请确保场景中有名为VictoryCanvas的GameObject");
        }

        Debug.Log("UI元素查找完成");
    }

    void InitializeUI()
    {
        Debug.Log("=== 开始初始化UI ===");

        if (victoryScreen == null)
        {
            Debug.LogError("victoryScreen为null，无法初始化UI");
            return;
        }

        // 保持VictoryCanvas激活，只隐藏子物体
        victoryScreen.SetActive(true);
        Debug.Log($"VictoryCanvas激活状态: {victoryScreen.activeSelf}");

        // 隐藏所有UI子物体
        if (darkOverlay != null)
        {
            darkOverlay.gameObject.SetActive(false);
            Debug.Log("隐藏DarkOverlay");
        }
        else
        {
            Debug.LogWarning("darkOverlay为null");
        }

        if (victoryText != null)
        {
            victoryText.gameObject.SetActive(false);
            Debug.Log("隐藏VictoryText");
        }
        else
        {
            Debug.LogWarning("victoryText为null");
        }

        // 隐藏ButtonPanel或按钮
        if (buttonPanel != null)
        {
            buttonPanel.SetActive(false);
            Debug.Log("隐藏ButtonPanel");
        }
        else
        {
            if (menuButton != null)
            {
                menuButton.gameObject.SetActive(false);
                Debug.Log("隐藏MenuButton");
            }
            else
            {
                Debug.LogWarning("menuButton为null");
            }
        }

        // 设置按钮点击事件
        if (menuButton != null)
        {
            menuButton.onClick.RemoveAllListeners();
            menuButton.onClick.AddListener(ReturnToMainMenu);
            Debug.Log("设置MenuButton点击事件");
        }

        // 确保Canvas组件正确设置
        Canvas canvas = victoryScreen.GetComponent<Canvas>();
        if (canvas == null)
        {
            Debug.LogWarning("VictoryCanvas没有Canvas组件，正在添加...");
            canvas = victoryScreen.AddComponent<Canvas>();
            victoryScreen.AddComponent<CanvasScaler>();
            victoryScreen.AddComponent<GraphicRaycaster>();

            // 设置Canvas属性
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 1000; // 设置比死亡界面更高的层级
            Debug.Log("添加并设置Canvas组件");
        }
        else
        {
            // 确保Canvas设置正确
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 1000;
            Debug.Log("Canvas组件已存在，已设置层级");
        }

        // 获取或添加CanvasGroup
        canvasGroup = victoryScreen.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = victoryScreen.AddComponent<CanvasGroup>();
            Debug.Log("添加CanvasGroup组件");
        }

        // 设置CanvasGroup初始状态
        canvasGroup.alpha = 1f;
        canvasGroup.interactable = true;
        canvasGroup.blocksRaycasts = true;

        Debug.Log($"CanvasGroup设置: alpha={canvasGroup.alpha}, interactable={canvasGroup.interactable}");
        Debug.Log("=== UI初始化完成 ===");
    }

    /// <summary>
    /// 显示通关界面
    /// </summary>
    public void ShowVictoryScreen()
    {
        Debug.Log("=== 开始显示通关界面 ===");
        Debug.Log($"调用前状态: isVictoryScreenActive={isVictoryScreenActive}, hasWon={hasWon}");

        if (isVictoryScreenActive || hasWon)
        {
            Debug.LogWarning("通关界面已经激活或已经通关，不重复显示");
            return;
        }

        hasWon = true;
        isVictoryScreenActive = true;
        Debug.Log("设置isVictoryScreenActive = true, hasWon = true");

        // 显示所有UI子物体
        if (darkOverlay != null)
        {
            darkOverlay.gameObject.SetActive(true);
            Debug.Log("显示DarkOverlay");
        }

        if (victoryText != null)
        {
            victoryText.gameObject.SetActive(true);
            Debug.Log($"显示VictoryText: {victoryText.text}");
        }

        // 显示ButtonPanel或按钮
        if (buttonPanel != null)
        {
            buttonPanel.SetActive(true);
            Debug.Log("显示ButtonPanel");
        }
        else
        {
            if (menuButton != null)
            {
                menuButton.gameObject.SetActive(true);
                Debug.Log("显示MenuButton");
            }
        }

        // 暂停游戏时间
        Time.timeScale = 0f;
        Debug.Log($"Time.timeScale设置为0，当前值: {Time.timeScale}");

        // 启用CanvasGroup交互
        if (canvasGroup != null)
        {
            canvasGroup.interactable = true;
            canvasGroup.blocksRaycasts = true;
            Debug.Log("启用CanvasGroup交互");
        }

        Debug.Log("=== 通关界面显示完成 ===");
    }

    /// <summary>
    /// 隐藏通关界面（只隐藏子物体，不隐藏Canvas）
    /// </summary>
    public void HideVictoryScreen()
    {
        Debug.Log("=== 隐藏通关界面 ===");

        if (!isVictoryScreenActive)
        {
            Debug.Log("界面未激活，无需隐藏");
            return;
        }

        isVictoryScreenActive = false;

        // 隐藏所有UI子物体
        if (darkOverlay != null)
        {
            darkOverlay.gameObject.SetActive(false);
            Debug.Log("隐藏DarkOverlay");
        }

        if (victoryText != null)
        {
            victoryText.gameObject.SetActive(false);
            Debug.Log("隐藏VictoryText");
        }

        // 隐藏ButtonPanel或按钮
        if (buttonPanel != null)
        {
            buttonPanel.SetActive(false);
            Debug.Log("隐藏ButtonPanel");
        }
        else
        {
            if (menuButton != null)
            {
                menuButton.gameObject.SetActive(false);
                Debug.Log("隐藏MenuButton");
            }
        }

        // 恢复游戏时间
        Time.timeScale = 1f;
        Debug.Log($"恢复Time.timeScale: {Time.timeScale}");

        // 禁用CanvasGroup交互
        if (canvasGroup != null)
        {
            canvasGroup.interactable = false;
            canvasGroup.blocksRaycasts = false;
            Debug.Log("禁用CanvasGroup交互");
        }

        Debug.Log("=== 通关界面隐藏完成 ===");
    }

    /// <summary>
    /// 返回主菜单
    /// </summary>
    public void ReturnToMainMenu()
    {
        Debug.Log("=== 返回主菜单 ===");

        // 恢复时间
        Time.timeScale = 1f;
        Debug.Log($"恢复Time.timeScale: {Time.timeScale}");

        // 重置状态
        isVictoryScreenActive = false;
        hasWon = false;

        // 隐藏UI子物体
        if (darkOverlay != null) darkOverlay.gameObject.SetActive(false);
        if (victoryText != null) victoryText.gameObject.SetActive(false);
        if (buttonPanel != null) buttonPanel.SetActive(false);
        else
        {
            if (menuButton != null) menuButton.gameObject.SetActive(false);
        }

        // 加载主菜单场景
        if (!string.IsNullOrEmpty(mainMenuScene))
        {
            SceneManager.LoadScene(0);
        }
        else
        {
            Debug.Log($"使用场景索引加载主菜单: {0}");
            SceneManager.LoadScene(0);
        }
    }

    void Update()
    {
        // 测试用：按V键显示通关界面
        if (Input.GetKeyDown(KeyCode.V))
        {
            Debug.Log("=====================");
            Debug.Log("V键已按下 - 测试显示通关界面");
            Debug.Log("=====================");
            ShowVictoryScreen();
        }

        // 测试用：按B键隐藏通关界面
        if (Input.GetKeyDown(KeyCode.B))
        {
            Debug.Log("=====================");
            Debug.Log("B键已按下 - 隐藏通关界面");
            Debug.Log("=====================");
            HideVictoryScreen();
        }

        // 如果界面已显示，按ESC键返回菜单
        if (isVictoryScreenActive && Input.GetKeyDown(KeyCode.Escape))
        {
            Debug.Log("ESC键按下 - 返回主菜单");
            ReturnToMainMenu();
        }
    }

    // 在Editor中显示当前状态
   
}