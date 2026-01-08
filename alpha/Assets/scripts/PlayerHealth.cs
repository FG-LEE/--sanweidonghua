using UnityEngine;
using UnityEngine.Events;
using System.Collections;

[System.Serializable]
public class HealthChangeEvent : UnityEvent<float, float, GameObject> { }

public class PlayerHealth : MonoBehaviour
{
    [Header("血量设置")]
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private float currentHealth = 100f;

    [Header("死亡检测设置")]
    [SerializeField] private bool useContinuousDeathCheck = true; // 是否启用持续死亡检测
    [SerializeField] private float deathCheckInterval = 0.1f; // 死亡检测间隔（秒）

    [Header("伤害免疫设置")]
    [SerializeField] private bool canTakeDamage = true;
    [SerializeField] private float damageCooldown = 0.5f;
    private float lastDamageTime = -Mathf.Infinity;

    [Header("受伤闪烁效果设置")]
    [SerializeField] private bool enableDamageFlash = true; // 是否启用受伤闪烁
    [SerializeField] private Color flashColor = Color.white; // 闪烁颜色（红白色）
    [SerializeField] private float flashDuration = 0.3f; // 闪烁持续时间
    [SerializeField] private int flashCount = 3; // 闪烁次数
    [SerializeField] private string childModelName = ""; // 子物体模型名称（留空则查找所有Renderer）

    [Header("死亡设置")]
    [SerializeField] private bool destroyOnDeath = false;
    [SerializeField] private float deathDelay = 0f;

    [Header("死亡状态")]
    [SerializeField] private bool isDead = false; // 死亡状态标志

    [Header("事件")]
    public HealthChangeEvent OnHealthChanged;
    public UnityEvent OnDeath;
    public UnityEvent OnHeal;
    public UnityEvent OnTakeDamage;

    // 闪烁相关变量
    private Renderer[] playerRenderers; // 存储所有渲染器
    private Color[] originalColors; // 存储原始颜色
    private bool isFlashing = false; // 是否正在闪烁

    // 属性访问器
    public float MaxHealth => maxHealth;
    public float CurrentHealth => currentHealth;
    public float HealthPercentage => currentHealth / maxHealth;
    public bool IsAlive => currentHealth > 0 && !isDead; // 修改：同时检查血量和死亡标志
    public bool CanTakeDamage => canTakeDamage && Time.time > lastDamageTime + damageCooldown;

    private void Start()
    {
        // 确保当前血量不超过最大血量
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);

        // 重置死亡状态
        isDead = false;

        // 初始化时触发一次健康变化事件
        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);

        // 初始化渲染器（用于闪烁效果）
        InitializeRenderers();

        // 开始持续死亡检测（如果启用）
        if (useContinuousDeathCheck)
        {
            StartCoroutine(ContinuousDeathCheck());
        }
    }

    /// <summary>
    /// 持续死亡检测协程
    /// </summary>
    private IEnumerator ContinuousDeathCheck()
    {
        Debug.Log("开始持续死亡检测");

        while (true)
        {
            yield return new WaitForSeconds(deathCheckInterval);

            // 如果血量≤0且未标记为死亡
            if (currentHealth <= 0 && !isDead)
            {
                Debug.Log($"持续死亡检测：血量={currentHealth}，触发死亡");
                Die();
            }
        }
    }

    /// <summary>
    /// 初始化玩家模型的渲染器
    /// </summary>
    private void InitializeRenderers()
    {
        if (!enableDamageFlash) return;

        // 如果指定了子物体名称
        if (!string.IsNullOrEmpty(childModelName))
        {
            // 按名称查找子物体
            Transform childModel = transform.Find(childModelName);
            if (childModel != null)
            {
                playerRenderers = childModel.GetComponentsInChildren<Renderer>();
            }
            else
            {
                Debug.LogWarning($"未找到名为 '{childModelName}' 的子物体，将查找所有子物体");
                playerRenderers = GetComponentsInChildren<Renderer>();
            }
        }
        else
        {
            // 查找所有子物体的渲染器
            playerRenderers = GetComponentsInChildren<Renderer>();
        }

        // 存储原始颜色
        if (playerRenderers != null && playerRenderers.Length > 0)
        {
            originalColors = new Color[playerRenderers.Length];
            for (int i = 0; i < playerRenderers.Length; i++)
            {
                if (playerRenderers[i].material.HasProperty("_Color"))
                {
                    originalColors[i] = playerRenderers[i].material.color;
                }
                else
                {
                    // 如果没有颜色属性，使用白色
                    originalColors[i] = Color.white;
                }
            }

            Debug.Log($"找到 {playerRenderers.Length} 个渲染器用于闪烁效果");
        }
        else
        {
            Debug.LogWarning("未找到任何渲染器组件，受伤闪烁效果将不可用");
        }
    }

    /// <summary>
    /// 对玩家造成伤害
    /// </summary>
    public bool TakeDamage(float damage, GameObject damageSource = null)
    {
        // 如果已经死亡，直接返回
        if (isDead)
        {
            Debug.Log($"{gameObject.name} 已经死亡，无法再受到伤害");
            return false;
        }

        // 检查伤害条件
        if (!CanTakeDamage || damage <= 0)
            return false;

        // 计算伤害后血量
        float newHealth = currentHealth - damage;

        // 如果新血量会≤0，确保触发死亡
        if (newHealth <= 0)
        {
            Debug.Log($"致命伤害：{damage}点，将导致死亡");
            currentHealth = 0;

            // 触发事件
            OnHealthChanged?.Invoke(currentHealth, maxHealth, damageSource);
            OnTakeDamage?.Invoke();

            // 直接调用Die，不需要等待持续检测
            Die();
        }
        else
        {
            // 非致命伤害
            currentHealth = newHealth;
            lastDamageTime = Time.time;

            // 触发事件
            OnHealthChanged?.Invoke(currentHealth, maxHealth, damageSource);
            OnTakeDamage?.Invoke();

            // 触发受伤闪烁效果
            if (enableDamageFlash && !isFlashing)
            {
                StartCoroutine(DamageFlashRoutine());
            }
        }

        Debug.Log($"{gameObject.name} 受到 {damage} 点伤害，剩余血量: {currentHealth}");
        return true;
    }

    /// <summary>
    /// 受伤闪烁协程
    /// </summary>
    private IEnumerator DamageFlashRoutine()
    {
        if (playerRenderers == null || playerRenderers.Length == 0) yield break;

        isFlashing = true;

        // 闪烁指定次数
        for (int i = 0; i < flashCount; i++)
        {
            // 闪烁为白色
            SetRenderersColor(flashColor);
            yield return new WaitForSeconds(flashDuration / (flashCount * 2));

            // 恢复原色
            SetRenderersColorToOriginal();
            yield return new WaitForSeconds(flashDuration / (flashCount * 2));
        }

        // 确保最后恢复原色
        SetRenderersColorToOriginal();
        isFlashing = false;
    }

    /// <summary>
    /// 设置所有渲染器的颜色
    /// </summary>
    private void SetRenderersColor(Color color)
    {
        if (playerRenderers == null) return;

        for (int i = 0; i < playerRenderers.Length; i++)
        {
            if (playerRenderers[i] != null && playerRenderers[i].material.HasProperty("_Color"))
            {
                playerRenderers[i].material.color = color;
            }
        }
    }

    /// <summary>
    /// 恢复所有渲染器的原始颜色
    /// </summary>
    private void SetRenderersColorToOriginal()
    {
        if (playerRenderers == null || originalColors == null) return;

        for (int i = 0; i < playerRenderers.Length; i++)
        {
            if (playerRenderers[i] != null && playerRenderers[i].material.HasProperty("_Color"))
            {
                playerRenderers[i].material.color = originalColors[i];
            }
        }
    }

    /// <summary>
    /// 治疗玩家
    /// </summary>
    public float Heal(float healAmount, GameObject healSource = null)
    {
        // 如果已经死亡，无法治疗
        if (isDead)
        {
            Debug.Log($"{gameObject.name} 已经死亡，无法治疗");
            return 0;
        }

        if (healAmount <= 0)
            return 0;

        float previousHealth = currentHealth;
        currentHealth = Mathf.Clamp(currentHealth + healAmount, 0, maxHealth);
        float actualHealAmount = currentHealth - previousHealth;

        // 触发事件
        OnHealthChanged?.Invoke(currentHealth, maxHealth, healSource);
        OnHeal?.Invoke();

        Debug.Log($"{gameObject.name} 恢复 {actualHealAmount} 点生命值，当前血量: {currentHealth}");
        return actualHealAmount;
    }

    /// <summary>
    /// 设置最大血量并调整当前血量
    /// </summary>
    public void SetMaxHealth(float newMaxHealth, bool fillHealth = false)
    {
        maxHealth = Mathf.Max(1, newMaxHealth);

        if (fillHealth)
            currentHealth = maxHealth;
        else
            currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);

        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);
    }

    /// <summary>
    /// 设置当前血量
    /// </summary>
    public void SetCurrentHealth(float newHealth)
    {
        // 如果已经死亡，设置血量需要特殊处理
        if (isDead && newHealth > 0)
        {
            Debug.Log("尝试为死亡的玩家设置血量，将尝试复活");
            Resurrect(newHealth);
            return;
        }

        currentHealth = Mathf.Clamp(newHealth, 0, maxHealth);
        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);

        // 如果血量变为0，触发死亡
        if (currentHealth <= 0 && !isDead)
        {
            Die();
        }
    }

    /// <summary>
    /// 立即杀死玩家
    /// </summary>
    public void Kill()
    {
        if (isDead) return;

        Debug.Log("强制杀死玩家");
        currentHealth = 0;
        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);
        Die();
    }

    /// <summary>
    /// 恢复全部血量
    /// </summary>
    public void FullHeal()
    {
        Heal(maxHealth - currentHealth);
    }

    /// <summary>
    /// 设置伤害免疫状态
    /// </summary>
    public void SetDamageable(bool damageable)
    {
        canTakeDamage = damageable;
    }

    /// <summary>
    /// 死亡处理（主方法）
    /// </summary>
    private void Die()
    {
        // 防止重复死亡
        if (isDead)
        {
            Debug.LogWarning("玩家已经死亡，Die方法被跳过");
            return;
        }

        // 标记为死亡
        isDead = true;

        Debug.Log($"{gameObject.name} 死亡，当前血量: {currentHealth}");

        // 触发死亡事件
        OnDeath?.Invoke();
        Debug.Log("OnDeath事件已触发");

        // 调用失败界面
        ShowDeathScreen();

        // 禁用碰撞器和物理组件
        var collider = GetComponent<Collider>();
        if (collider != null) collider.enabled = false;

        var rigidbody = GetComponent<Rigidbody>();
        if (rigidbody != null) rigidbody.isKinematic = true;

        // 可选：销毁对象
        if (destroyOnDeath)
        {
            if (deathDelay > 0)
                Destroy(gameObject, deathDelay);
            else
                Destroy(gameObject);
        }
    }

    /// <summary>
    /// 复活玩家
    /// </summary>
    public void Resurrect(float health = -1)
    {
        if (!isDead)
        {
            Debug.LogWarning("玩家未死亡，无需复活");
            return;
        }

        Debug.Log($"{gameObject.name} 复活");

        // 重置死亡状态
        isDead = false;

        // 设置血量
        if (health <= 0)
            currentHealth = maxHealth;
        else
            currentHealth = Mathf.Clamp(health, 0, maxHealth);

        // 重新启用碰撞器和物理组件
        var collider = GetComponent<Collider>();
        if (collider != null) collider.enabled = true;

        var rigidbody = GetComponent<Rigidbody>();
        if (rigidbody != null) rigidbody.isKinematic = false;

        // 触发血量变化事件
        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);

        Debug.Log($"复活完成，血量: {currentHealth}/{maxHealth}");
    }

    /// <summary>
    /// 显示失败界面
    /// </summary>
    private void ShowDeathScreen()
    {
        Debug.Log($"PlayerHealth: 显示死亡界面");

        // 查找DeathScreenManager
        DeathScreenManager deathManager = FindObjectOfType<DeathScreenManager>();
        if (deathManager != null)
        {
            deathManager.ShowDeathScreen();
        }
        else
        {
            Debug.LogWarning("未找到DeathScreenManager，无法显示失败界面");
            // 备用方案：暂停游戏
            Time.timeScale = 0f;
        }
    }

    void OnDestroy()
    {
        // 确保恢复颜色
        if (isFlashing)
        {
            SetRenderersColorToOriginal();
        }
    }

    void Update()
    {
        // 测试用：按Y键强制杀死玩家
        if (Input.GetKeyDown(KeyCode.Y))
        {
            Debug.Log("=== Y键按下：强制死亡 ===");
            Kill();
        }

        // 测试用：按U键直接调用Die方法
        if (Input.GetKeyDown(KeyCode.U))
        {
            Debug.Log("=== U键按下：直接调用Die方法 ===");
            Die();
        }

        // 测试用：按I键直接触发OnDeath事件
        if (Input.GetKeyDown(KeyCode.I))
        {
            Debug.Log("=== I键按下：直接触发OnDeath事件 ===");
            if (OnDeath != null)
            {
                Debug.Log($"触发OnDeath事件");
                OnDeath.Invoke();
            }
            else
            {
                Debug.LogWarning("OnDeath事件为null");
            }
        }

        

        // 测试用：按K键设置血量为0
        if (Input.GetKeyDown(KeyCode.K))
        {
            Debug.Log("=== K键按下：设置血量为0 ===");
            SetCurrentHealth(0f);
        }
    }

    
}