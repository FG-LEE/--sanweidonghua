using System;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using static UnityEditor.Experimental.GraphView.GraphView;

public class PlayerHealth : MonoBehaviour
{
    [Header("健康设置")]
    [SerializeField] private int maxHits = 5; // 最大受击次数
    [SerializeField] private float invincibilityTime = 2f; // 无敌时间
    [SerializeField] private float hitStunDuration = 0.5f; // 硬直时间

    [Header("受击效果")]
    [SerializeField] private float knockbackForce = 10f; // 击退力度
    [SerializeField] private Renderer playerRenderer; // 用于无敌闪烁效果

    [Header("引用")]
    [SerializeField] private Player player; // 引用移动脚本
    [SerializeField] private Rigidbody rb; // 玩家刚体（可手动指定或自动获取）

    private int currentHits;
    private bool isInvincible;
    private float invincibilityTimer;
    private float hitStunTimer;
    private bool isInHitStun;

    // 受击事件（可用于UI更新血量显示）
    public Action<int> OnHit;
    public Action OnDeath;

    private void Start()
    {
        currentHits = 0;
        isInvincible = false;

        // 自动获取组件
            player = GetComponent<Player>();
        if (player == null)
        if (rb == null)
            rb = GetComponent<Rigidbody>();
        if (playerRenderer == null)
            playerRenderer = GetComponentInChildren<Renderer>();
    }

    private void Update()
    {
        // 处理无敌状态
        if (isInvincible)
        {
            invincibilityTimer += Time.deltaTime;
            InvincibilityEffect();

            if (invincibilityTimer >= invincibilityTime)
            {
                isInvincible = false;
                if (playerRenderer != null)
                    playerRenderer.enabled = true; // 确保最后可见
            }
        }

        // 处理硬直状态
        if (isInHitStun)
        {
            hitStunTimer += Time.deltaTime;
            if (hitStunTimer >= hitStunDuration)
            {
                isInHitStun = false;
            }
        }
    }

    // 处理受击逻辑（核心弹开效果）
    public void TakeHit(Vector3 knockbackDirection)
    {
        if (isInvincible || isInHitStun)
            return;

        currentHits++;
        OnHit?.Invoke(currentHits); // 触发血量更新事件

        // 进入硬直状态
        isInHitStun = true;
        hitStunTimer = 0f;

        // 应用击退效果（核心）
        ApplyKnockback(knockbackDirection);

        // 检查是否达到最大受击次数
        if (currentHits >= maxHits)
        {
            Die();
            return;
        }

        // 进入无敌状态
        SetInvincible(invincibilityTime);
    }

    // 应用击退效果（核心逻辑）
    private void ApplyKnockback(Vector3 direction)
    {
        if (rb == null) return;

        // 清除当前速度，应用击退力
        rb.velocity = Vector3.zero;
        direction.y = 0.3f; // 稍微向上弹开，避免贴地
        rb.AddForce(direction * knockbackForce, ForceMode.Impulse);
    }

    // 无敌状态闪烁效果（可选，增强反馈）
    private void InvincibilityEffect()
    {
        if (playerRenderer == null) return;

        // 每0.1秒闪烁一次
        float flashRate = 0.1f;
        playerRenderer.enabled = (Mathf.Floor(invincibilityTimer / flashRate) % 2 == 0);
    }

    // 死亡处理（简化版，无动画）
    private void Die()
    {
        OnDeath?.Invoke();

        // 禁用移动和物理交互
        if (player != null)
            player.enabled = false;
        if (rb != null)
        {
            rb.isKinematic = true;
            rb.velocity = Vector3.zero;
        }

        // 隐藏玩家（可选）
        if (playerRenderer != null)
            playerRenderer.enabled = false;

        // 延迟后重启场景
        StartCoroutine(ReloadSceneAfterDelay(2f));
    }

    // 延迟重启场景
    private IEnumerator ReloadSceneAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    // 供移动脚本判断是否可以移动
    public bool CanMove()
    {
        return !isInHitStun && !isInvincible;
    }

    // 检查是否可以受击
    internal bool CanTakeDamage()
    {
        return !isInvincible && !isInHitStun;
    }

    // 扣除血量（直接调用TakeHit实现弹开）
    internal void TakeDamage(int damageAmount)
    {
        if (!CanTakeDamage()) return;

        // 这里简化处理：每次伤害触发一次弹开（方向默认向上前方）
        Vector3 defaultKnockback = (transform.forward + Vector3.up * 0.3f).normalized;
        TakeHit(defaultKnockback);
    }

    // 设置无敌状态
    internal void SetInvincible(float time)
    {
        isInvincible = true;
        invincibilityTimer = 0f;
        invincibilityTime = time;
    }
}