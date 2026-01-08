using UnityEngine;

public class VictoryCrystal : MonoBehaviour
{
    [Header("通关水晶设置")]
    [SerializeField] private string playerTag = "Player"; // 玩家标签
    [SerializeField] private string victoryCrystalTag = "VictoryCrystal"; // 水晶标签
    [SerializeField] private bool destroyOnTouch = true; // 触碰后销毁
    [SerializeField] private GameObject particleEffect; // 触碰粒子效果

    [Header("音效")]
    [SerializeField] private AudioClip touchSound; // 触碰音效
    [SerializeField] private float soundVolume = 1f;

    [Header("音频控制")]
    [SerializeField] private bool stopBGMOnTouch = true; // 触碰时停止背景音乐
    [SerializeField] private bool pauseBGMOnTouch = false; // 触碰时暂停背景音乐（可选）

    private AudioSource audioSource;
    private bool hasBeenTouched = false;

    void Start()
    {
        // 确保标签正确
        if (!string.IsNullOrEmpty(victoryCrystalTag))
        {
            gameObject.tag = victoryCrystalTag;
        }

        // 获取或添加AudioSource
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null && touchSound != null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (hasBeenTouched) return;

        // 检查是否是玩家触碰
        if (other.CompareTag(playerTag))
        {
            Debug.Log($"玩家触碰通关水晶: {gameObject.name}");
            OnPlayerTouch();
        }
    }

    void OnCollisionEnter(Collision collision)
    {
        if (hasBeenTouched) return;

        // 检查是否是玩家碰撞
        if (collision.gameObject.CompareTag(playerTag))
        {
            Debug.Log($"玩家碰撞通关水晶: {gameObject.name}");
            OnPlayerTouch();
        }
    }

    void OnPlayerTouch()
    {
        hasBeenTouched = true;

        // 停止背景音乐
        StopBackgroundMusic();

        // 播放音效
        if (touchSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(touchSound, soundVolume);
        }

        // 播放粒子效果
        if (particleEffect != null)
        {
            Instantiate(particleEffect, transform.position, Quaternion.identity);
        }

        // 显示通关界面
        ShowVictoryScreen();

        // 可选：销毁水晶
        if (destroyOnTouch)
        {
            // 等待音效播放完成
            if (touchSound != null && audioSource != null)
            {
                Destroy(gameObject, touchSound.length);
            }
            else
            {
                Destroy(gameObject);
            }
        }
    }

    /// <summary>
    /// 停止背景音乐
    /// </summary>
    void StopBackgroundMusic()
    {
        if (!stopBGMOnTouch) return;

        try
        {
            // 方法1：直接调用AudioManager的单例
            if (AudioManager.instance != null)
            {
                Debug.Log("通过AudioManager.instance停止BGM");
                AudioManager.instance.StopAllBGM();
                AudioManager.instance.playBgm = false; // 确保不会自动重新播放
            }
            // 方法2：通过查找对象
            else
            {
                AudioManager audioManager = FindObjectOfType<AudioManager>();
                if (audioManager != null)
                {
                    Debug.Log("通过FindObjectOfType停止BGM");
                    audioManager.StopAllBGM();

                    // 使用反射设置私有字段（如果playBgm不是public）
                    var playBgmField = typeof(AudioManager).GetField("playBgm",
                        System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
                    if (playBgmField != null)
                    {
                        playBgmField.SetValue(audioManager, false);
                    }
                }
            }
        }
        catch (System.Exception e)
        {
            Debug.LogWarning($"停止BGM时出错: {e.Message}");
        }
    }

    void ShowVictoryScreen()
    {
        Debug.Log("触发通关界面");

        // 查找VictoryScreenManager
        VictoryScreenManager victoryManager = FindObjectOfType<VictoryScreenManager>();
        if (victoryManager != null)
        {
            victoryManager.ShowVictoryScreen();
        }
        else
        {
            Debug.LogError("未找到VictoryScreenManager，无法显示通关界面");

            // 尝试直接查找并调用
            GameObject victoryCanvas = GameObject.Find("VictoryCanvas");
            if (victoryCanvas != null)
            {
                victoryManager = victoryCanvas.GetComponent<VictoryScreenManager>();
                if (victoryManager != null)
                {
                    victoryManager.ShowVictoryScreen();
                }
            }
        }
    }
}