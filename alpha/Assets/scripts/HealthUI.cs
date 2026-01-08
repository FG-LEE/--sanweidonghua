using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class HealthUI : MonoBehaviour
{
    [Header("UI引用")]
    [SerializeField] private Slider healthSlider;
    [SerializeField] private Image healthFillImage;
    [SerializeField] private TextMeshProUGUI healthText;

    [Header("颜色渐变")]
    [SerializeField] private Gradient healthGradient;
    [SerializeField] private Color fullHealthColor = Color.green;
    [SerializeField] private Color lowHealthColor = Color.red;

    [Header("低血量警告")]
    [SerializeField] private GameObject lowHealthWarning;
    [SerializeField] private float lowHealthThreshold = 0.3f;
    [SerializeField] private float warningFlashSpeed = 2f;

    [Header("伤害显示")]
    [SerializeField] private GameObject damageTextPrefab;
    [SerializeField] private Transform damageTextSpawnPoint;

    private PlayerHealth playerHealth;

    private void Start()
    {
        // 查找玩家血量组件
        playerHealth = FindObjectOfType<PlayerHealth>();

        if (playerHealth == null)
        {
            Debug.LogError("未找到PlayerHealth组件！");
            return;
        }

        // 初始化UI
        InitializeUI();

        // 订阅事件
        playerHealth.OnHealthChanged.AddListener(UpdateHealthUI);
        playerHealth.OnTakeDamage.AddListener(ShowDamageEffect);
    }

    private void InitializeUI()
    {
        if (healthSlider != null)
        {
            healthSlider.maxValue = playerHealth.MaxHealth;
            healthSlider.value = playerHealth.CurrentHealth;
        }

        UpdateHealthUI(playerHealth.CurrentHealth, playerHealth.MaxHealth, null);
    }

    private void UpdateHealthUI(float currentHealth, float maxHealth, GameObject source)
    {
        float healthPercentage = currentHealth / maxHealth;

        // 更新Slider
        if (healthSlider != null)
        {
            healthSlider.maxValue = maxHealth;
            healthSlider.value = currentHealth;
        }

        // 更新文本
        if (healthText != null)
        {
            healthText.text = $"{currentHealth:F0}/{maxHealth:F0}";
        }

        // 更新填充颜色
        if (healthFillImage != null)
        {
            if (healthGradient != null && healthGradient.colorKeys.Length > 0)
            {
                healthFillImage.color = healthGradient.Evaluate(healthPercentage);
            }
            else
            {
                healthFillImage.color = Color.Lerp(lowHealthColor, fullHealthColor, healthPercentage);
            }
        }

        // 低血量警告
        if (lowHealthWarning != null)
        {
            lowHealthWarning.SetActive(healthPercentage <= lowHealthThreshold);

            if (healthPercentage <= lowHealthThreshold)
            {
                // 闪烁效果
                float alpha = Mathf.PingPong(Time.time * warningFlashSpeed, 1f);
                lowHealthWarning.GetComponent<Image>().color = new Color(1, 0, 0, alpha);
            }
        }
    }

    private void ShowDamageEffect()
    {
        // 显示伤害数字（可选）
        if (damageTextPrefab != null && damageTextSpawnPoint != null)
        {
            GameObject damageText = Instantiate(damageTextPrefab, damageTextSpawnPoint.position, Quaternion.identity);
            damageText.transform.SetParent(transform, true);
            Destroy(damageText, 1f);
        }

        // 可以添加屏幕震动、红色闪烁等效果
    }

    private void OnDestroy()
    {
        // 取消订阅事件
        if (playerHealth != null)
        {
            playerHealth.OnHealthChanged.RemoveListener(UpdateHealthUI);
            playerHealth.OnTakeDamage.RemoveListener(ShowDamageEffect);
        }
    }
}