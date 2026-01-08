using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;

public class DeathScreenManager : MonoBehaviour
{
    [Header("UI元素引用")]
    [SerializeField] private GameObject deathScreen; // 整个失败界面
    [SerializeField] private Image darkOverlay;      // 变暗背景
    [SerializeField] private TMP_Text deathText;     // 死亡文字
    [SerializeField] private Button restartButton;   // 重新开始按钮
    [SerializeField] private Button menuButton;      // 返回主菜单按钮
    [SerializeField] private GameObject buttonPanel; // 按钮面板（可选）

    [Header("场景设置")]
    [SerializeField] private string mainMenuScene = "Menu"; // 主菜单场景名称
    [SerializeField] private int gameSceneIndex = 1;            // 游戏场景索引

    private CanvasGroup canvasGroup;
    private bool isDeathScreenActive = false;

    void Awake()
    {
        Debug.Log($"=== DeathScreenManager Awake开始 ===");
        Debug.Log($"脚本启用状态: {enabled}");
        Debug.Log($"GameObject激活状态: {gameObject.activeSelf}");

        // 自动查找UI元素（如果没手动指定）
        AutoFindUIElements();

        // 初始化UI（隐藏子物体，但保持Canvas激活）
        InitializeUI();

        // 监听玩家死亡事件
        SubscribeToPlayerDeath();

        Debug.Log("=== DeathScreenManager Awake完成 ===");
    }

    void AutoFindUIElements()
    {
        Debug.Log("开始自动查找UI元素...");

        // 如果Inspector中没有指定，自动查找
        if (deathScreen == null)
        {
            deathScreen = GameObject.Find("DeathCanvas");
            Debug.Log($"查找DeathCanvas: {(deathScreen != null ? "找到" : "未找到")}");
        }

        if (deathScreen != null)
        {
            Debug.Log($"找到DeathCanvas: {deathScreen.name}, 激活状态: {deathScreen.activeSelf}");

            // 查找DarkOverlay
            if (darkOverlay == null)
            {
                darkOverlay = deathScreen.transform.Find("DarkOverlay")?.GetComponent<Image>();
                Debug.Log($"找到darkOverlay: {(darkOverlay != null ? "成功" : "失败")}");
            }

            // 查找DeathText
            if (deathText == null)
            {
                deathText = deathScreen.transform.Find("DeathText")?.GetComponent<TMP_Text>();
                Debug.Log($"找到deathText: {(deathText != null ? "成功" : "失败")}");
            }

            // 查找ButtonPanel
            if (buttonPanel == null)
            {
                buttonPanel = deathScreen.transform.Find("ButtonPanel")?.gameObject;
                Debug.Log($"找到buttonPanel: {(buttonPanel != null ? "成功" : "失败")}");
            }

            // 查找按钮（可能在ButtonPanel下）
            if (restartButton == null)
            {
                // 先在ButtonPanel下查找
                if (buttonPanel != null)
                {
                    restartButton = buttonPanel.transform.Find("RestartButton")?.GetComponent<Button>();
                }

                // 如果没找到，直接在DeathCanvas下查找
                if (restartButton == null)
                {
                    restartButton = deathScreen.transform.Find("RestartButton")?.GetComponent<Button>();
                }
                Debug.Log($"找到restartButton: {(restartButton != null ? "成功" : "失败")}");
            }

            if (menuButton == null)
            {
                // 先在ButtonPanel下查找
                if (buttonPanel != null)
                {
                    menuButton = buttonPanel.transform.Find("MenuButton")?.GetComponent<Button>();
                }

                // 如果没找到，直接在DeathCanvas下查找
                if (menuButton == null)
                {
                    menuButton = deathScreen.transform.Find("MenuButton")?.GetComponent<Button>();
                }
                Debug.Log($"找到menuButton: {(menuButton != null ? "成功" : "失败")}");
            }
        }
        else
        {
            Debug.LogError("未找到DeathCanvas！请确保场景中有名为DeathCanvas的GameObject");
        }

        Debug.Log("UI元素查找完成");
    }

    void InitializeUI()
    {
        Debug.Log("=== 开始初始化UI ===");

        if (deathScreen == null)
        {
            Debug.LogError("deathScreen为null，无法初始化UI");
            return;
        }

        // 关键修改：保持DeathCanvas激活，只隐藏子物体
        deathScreen.SetActive(true); // 确保Canvas是激活的
        Debug.Log($"DeathCanvas激活状态: {deathScreen.activeSelf}");

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

        if (deathText != null)
        {
            deathText.gameObject.SetActive(false);
            Debug.Log("隐藏DeathText");
        }
        else
        {
            Debug.LogWarning("deathText为null");
        }

        // 隐藏ButtonPanel（如果存在）
        if (buttonPanel != null)
        {
            buttonPanel.SetActive(false);
            Debug.Log("隐藏ButtonPanel");
        }
        else
        {
            // 如果没找到ButtonPanel，直接隐藏按钮
            if (restartButton != null)
            {
                restartButton.gameObject.SetActive(false);
                Debug.Log("隐藏RestartButton");
            }
            else
            {
                Debug.LogWarning("restartButton为null");
            }

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
        if (restartButton != null)
        {
            restartButton.onClick.RemoveAllListeners();
            restartButton.onClick.AddListener(RestartGame);
            Debug.Log("设置RestartButton点击事件");
        }

        if (menuButton != null)
        {
            menuButton.onClick.RemoveAllListeners();
            menuButton.onClick.AddListener(ReturnToMainMenu);
            Debug.Log("设置MenuButton点击事件");
        }

        // 确保Canvas组件正确设置
        Canvas canvas = deathScreen.GetComponent<Canvas>();
        if (canvas == null)
        {
            Debug.LogWarning("DeathCanvas没有Canvas组件，正在添加...");
            canvas = deathScreen.AddComponent<Canvas>();
            deathScreen.AddComponent<CanvasScaler>();
            deathScreen.AddComponent<GraphicRaycaster>();

            // 设置Canvas属性
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 999; // 设置很高的层级
            Debug.Log("添加并设置Canvas组件");
        }
        else
        {
            // 确保Canvas设置正确
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 999;
            Debug.Log("Canvas组件已存在，已设置层级");
        }

        // 获取或添加CanvasGroup
        canvasGroup = deathScreen.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = deathScreen.AddComponent<CanvasGroup>();
            Debug.Log("添加CanvasGroup组件");
        }

        // 设置CanvasGroup初始状态
        canvasGroup.alpha = 1f; // CanvasGroup完全不透明
        canvasGroup.interactable = true; // 允许交互
        canvasGroup.blocksRaycasts = true; // 允许射线检测

        Debug.Log($"CanvasGroup设置: alpha={canvasGroup.alpha}, interactable={canvasGroup.interactable}");
        Debug.Log("=== UI初始化完成 ===");
    }

    void SubscribeToPlayerDeath()
    {
        Debug.Log("开始监听玩家死亡事件...");

        // 查找玩家血量组件并监听死亡事件
        PlayerHealth playerHealth = FindObjectOfType<PlayerHealth>();
        if (playerHealth != null)
        {
            playerHealth.OnDeath.AddListener(ShowDeathScreen);
            Debug.Log("已成功监听PlayerHealth.OnDeath事件");
        }
        else
        {
            Debug.LogWarning("未找到PlayerHealth组件");
        }
    }

    /// <summary>
    /// 显示失败界面
    /// </summary>
    public void ShowDeathScreen()
    {
        Debug.Log("=== 开始显示死亡界面 ===");
        Debug.Log($"调用前状态: isDeathScreenActive={isDeathScreenActive}");

        if (isDeathScreenActive)
        {
            Debug.LogWarning("死亡界面已经激活，不重复显示");
            return;
        }

        isDeathScreenActive = true;
        Debug.Log("设置isDeathScreenActive = true");

        // 显示所有UI子物体
        if (darkOverlay != null)
        {
            darkOverlay.gameObject.SetActive(true);
            Debug.Log("显示DarkOverlay");
        }

        if (deathText != null)
        {
            deathText.gameObject.SetActive(true);
            Debug.Log($"显示DeathText: {deathText.text}");
        }

        // 显示ButtonPanel或按钮
        if (buttonPanel != null)
        {
            buttonPanel.SetActive(true);
            Debug.Log("显示ButtonPanel");
        }
        else
        {
            // 如果没有ButtonPanel，直接显示按钮
            if (restartButton != null)
            {
                restartButton.gameObject.SetActive(true);
                Debug.Log("显示RestartButton");
            }

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

        Debug.Log("=== 死亡界面显示完成 ===");
    }

    /// <summary>
    /// 隐藏失败界面（只隐藏子物体，不隐藏Canvas）
    /// </summary>
    public void HideDeathScreen()
    {
        Debug.Log("=== 隐藏死亡界面 ===");

        if (!isDeathScreenActive)
        {
            Debug.Log("界面未激活，无需隐藏");
            return;
        }

        isDeathScreenActive = false;

        // 隐藏所有UI子物体
        if (darkOverlay != null)
        {
            darkOverlay.gameObject.SetActive(false);
            Debug.Log("隐藏DarkOverlay");
        }

        if (deathText != null)
        {
            deathText.gameObject.SetActive(false);
            Debug.Log("隐藏DeathText");
        }

        // 隐藏ButtonPanel或按钮
        if (buttonPanel != null)
        {
            buttonPanel.SetActive(false);
            Debug.Log("隐藏ButtonPanel");
        }
        else
        {
            if (restartButton != null)
            {
                restartButton.gameObject.SetActive(false);
                Debug.Log("隐藏RestartButton");
            }

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

        Debug.Log("=== 死亡界面隐藏完成 ===");
    }

    /// <summary>
    /// 重新开始游戏
    /// </summary>
    public void RestartGame()
    {
        Debug.Log("=== 重新开始游戏 ===");

        // 恢复时间
        Time.timeScale = 1f;
        Debug.Log($"恢复Time.timeScale: {Time.timeScale}");

        // 重置状态
        isDeathScreenActive = false;

        // 隐藏UI子物体
        if (darkOverlay != null) darkOverlay.gameObject.SetActive(false);
        if (deathText != null) deathText.gameObject.SetActive(false);
        if (buttonPanel != null) buttonPanel.SetActive(false);
        else
        {
            if (restartButton != null) restartButton.gameObject.SetActive(false);
            if (menuButton != null) menuButton.gameObject.SetActive(false);
        }

        // 重新加载当前场景
        int currentSceneIndex = SceneManager.GetActiveScene().buildIndex;
        Debug.Log($"重新加载场景: {currentSceneIndex}");
        SceneManager.LoadScene(currentSceneIndex);
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
        isDeathScreenActive = false;

        // 隐藏UI子物体
        if (darkOverlay != null) darkOverlay.gameObject.SetActive(false);
        if (deathText != null) deathText.gameObject.SetActive(false);
        if (buttonPanel != null) buttonPanel.SetActive(false);
        else
        {
            if (restartButton != null) restartButton.gameObject.SetActive(false);
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
            SceneManager.LoadScene(0); // 假设主菜单是第一个场景
        }
    }

    void Update()
    {
        // 测试用：按T键显示失败界面
        if (Input.GetKeyDown(KeyCode.T))
        {
            Debug.Log("=====================");
            Debug.Log("T键已按下 - 测试显示死亡界面");
            Debug.Log("=====================");
            ShowDeathScreen();
        }

        // 测试用：按H键隐藏失败界面
        if (Input.GetKeyDown(KeyCode.H))
        {
            Debug.Log("=====================");
            Debug.Log("H键已按下 - 隐藏死亡界面");
            Debug.Log("=====================");
            HideDeathScreen();
        }

        // 测试用：按R键重新开始
        if (Input.GetKeyDown(KeyCode.R))
        {
            Debug.Log("R键已按下 - 重新开始游戏");
            RestartGame();
        }

        // 如果界面已显示，按ESC键返回菜单
        if (isDeathScreenActive && Input.GetKeyDown(KeyCode.Escape))
        {
            Debug.Log("ESC键按下 - 返回主菜单");
            ReturnToMainMenu();
        }
    }

    
}