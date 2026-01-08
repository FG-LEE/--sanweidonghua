using UnityEngine;
using UnityEngine.Events;

[System.Serializable]
public class HealthChangeEvent : UnityEvent<float, float, GameObject> { }

public class PlayerHealth : MonoBehaviour
{
    [Header("血量设置")]
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private float currentHealth = 100f;

    [Header("伤害免疫设置")]
    [SerializeField] private bool canTakeDamage = true;
    [SerializeField] private float damageCooldown = 0.5f;
    private float lastDamageTime = -Mathf.Infinity;

    [Header("死亡设置")]
    [SerializeField] private bool destroyOnDeath = false;
    [SerializeField] private float deathDelay = 0f;

    [Header("事件")]
    public HealthChangeEvent OnHealthChanged;
    public UnityEvent OnDeath;
    public UnityEvent OnHeal;
    public UnityEvent OnTakeDamage;

    // 属性访问器
    public float MaxHealth => maxHealth;
    public float CurrentHealth => currentHealth;
    public float HealthPercentage => currentHealth / maxHealth;
    public bool IsAlive => currentHealth > 0;
    public bool CanTakeDamage => canTakeDamage && Time.time > lastDamageTime + damageCooldown;

    private void Start()
    {
        // 确保当前血量不超过最大血量
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);

        // 初始化时触发一次健康变化事件
        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);
    }

    /// <summary>
    /// 对玩家造成伤害
    /// </summary>
    /// <param name="damage">伤害值</param>
    /// <param name="damageSource">伤害来源（可选）</param>
    /// <returns>是否成功造成伤害</returns>
    public bool TakeDamage(float damage, GameObject damageSource = null)
    {
        if (!CanTakeDamage || !IsAlive || damage <= 0)
            return false;

        currentHealth -= damage;
        lastDamageTime = Time.time;

        // 触发事件
        OnHealthChanged?.Invoke(currentHealth, maxHealth, damageSource);
        OnTakeDamage?.Invoke();

        // 检查是否死亡
        if (currentHealth <= 0)
        {
            currentHealth = 0;
            Die();
        }

        Debug.Log($"{gameObject.name} 受到 {damage} 点伤害，剩余血量: {currentHealth}");
        return true;
    }

    /// <summary>
    /// 治疗玩家
    /// </summary>
    /// <param name="healAmount">治疗量</param>
    /// <param name="healSource">治疗来源（可选）</param>
    /// <returns>实际治疗量</returns>
    public float Heal(float healAmount, GameObject healSource = null)
    {
        if (!IsAlive || healAmount <= 0)
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
        currentHealth = Mathf.Clamp(newHealth, 0, maxHealth);
        OnHealthChanged?.Invoke(currentHealth, maxHealth, null);

        if (currentHealth <= 0 && IsAlive)
            Die();
    }

    /// <summary>
    /// 立即杀死玩家
    /// </summary>
    public void Kill()
    {
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
    /// 死亡处理
    /// </summary>
    private void Die()
    {
        if (!IsAlive) return;

        Debug.Log($"{gameObject.name} 死亡");
        OnDeath?.Invoke();

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

    // 在Inspector中显示调试信息
    private void OnGUI()
    {
#if UNITY_EDITOR
        if (!Application.isPlaying) return;

        GUILayout.BeginArea(new Rect(10, 10, 200, 100));
        GUILayout.Box("玩家血量信息");
        GUILayout.Label($"当前血量: {currentHealth}/{maxHealth}");
        GUILayout.Label($"血量百分比: {HealthPercentage:P0}");
        GUILayout.Label($"状态: {(IsAlive ? "存活" : "死亡")}");
        GUILayout.EndArea();
#endif
    }
}