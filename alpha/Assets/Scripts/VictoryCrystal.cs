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