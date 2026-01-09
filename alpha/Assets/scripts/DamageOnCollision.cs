using UnityEngine;

public class DamageOnCollision : MonoBehaviour
{
    [Header("伤害设置")]
    [SerializeField] private float damageAmount = 10f;
    [SerializeField] private bool destroyOnCollision = false;
    [SerializeField] private string[] targetTags = { "Player" };
    [SerializeField] private LayerMask targetLayers = -1; // 默认所有层

    [Header("碰撞设置")]
    [SerializeField] private float collisionForceThreshold = 0f;
    [SerializeField] private bool useVelocityBasedDamage = false;
    [SerializeField] private float velocityMultiplier = 1f;

    [Header("击退效果设置")]
    [SerializeField] private bool enableKnockback = true; // 是否启用击退
    [SerializeField] private float knockbackForce = 10f; // 击退力度大小
    [SerializeField] private float upwardForce = 2f; // 向上击退的力度
    [SerializeField] private bool knockbackInOppositeDirection = true; // 是否向相反方向击退

    [Header("视觉效果")]
    [SerializeField] private GameObject hitEffect;

    private void OnCollisionEnter(Collision collision)
    {
        // 检查层和标签
        if (!IsValidTarget(collision.gameObject))
            return;

        // 检查碰撞力度阈值
        if (collisionForceThreshold > 0 && collision.relativeVelocity.magnitude < collisionForceThreshold)
            return;

        // 计算伤害
        float finalDamage = damageAmount;

        if (useVelocityBasedDamage)
        {
            finalDamage += collision.relativeVelocity.magnitude * velocityMultiplier;
        }

        // 应用伤害
        ApplyDamage(collision.gameObject, finalDamage, collision);

        // 应用击退效果
        if (enableKnockback)
        {
            ApplyKnockback(collision);
        }

        // 销毁自身（如果需要）
        if (destroyOnCollision)
            Destroy(gameObject);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!IsValidTarget(other.gameObject))
            return;

        ApplyDamage(other.gameObject, damageAmount);

        // 对于触发器，也需要击退效果
        if (enableKnockback)
        {
            ApplyKnockback(other.gameObject);
        }

        if (destroyOnCollision)
            Destroy(gameObject);
    }

    private bool IsValidTarget(GameObject target)
    {
        // 检查标签
        bool tagValid = false;
        foreach (string tag in targetTags)
        {
            if (target.CompareTag(tag))
            {
                tagValid = true;
                break;
            }
        }

        // 检查层
        bool layerValid = targetLayers == (targetLayers | (1 << target.layer));

        return tagValid && layerValid;
    }

    private void ApplyDamage(GameObject target, float damage, Collision collision = null)
    {
        // 方式1：直接获取PlayerHealth组件
        PlayerHealth health = target.GetComponent<PlayerHealth>();
        if (health != null)
        {
            health.TakeDamage(damage, gameObject);
            CreateHitEffect(collision);
            return;
        }

        // 方式2：发送消息（兼容旧系统）
        target.SendMessage("TakeDamage", damage, SendMessageOptions.DontRequireReceiver);
        target.SendMessage("ApplyDamage", damage, SendMessageOptions.DontRequireReceiver);
    }

    /// <summary>
    /// 应用击退效果（碰撞体版本）
    /// </summary>
    private void ApplyKnockback(Collision collision)
    {
        GameObject target = collision.gameObject;
        Rigidbody targetRb = target.GetComponent<Rigidbody>();

        if (targetRb == null) return;

        // 计算击退方向
        Vector3 knockbackDirection;

        if (knockbackInOppositeDirection)
        {
            // 获取玩家当前的移动方向（从刚体速度）
            Vector3 playerVelocity = targetRb.velocity;

            if (playerVelocity.magnitude > 0.1f)
            {
                // 向玩家当前运动方向的相反方向击退
                knockbackDirection = -playerVelocity.normalized;
            }
            else
            {
                // 如果玩家没有明显速度，使用从伤害源指向玩家的方向
                knockbackDirection = (target.transform.position - transform.position).normalized;
            }
        }
        else
        {
            // 简单的从伤害源指向玩家的方向
            knockbackDirection = (target.transform.position - transform.position).normalized;
        }

        // 创建最终的击退力（包含向上分量）
        Vector3 finalKnockback = knockbackDirection * knockbackForce + Vector3.up * upwardForce;

        // 应用击退力
        targetRb.AddForce(finalKnockback, ForceMode.Impulse);

        Debug.Log($"击退玩家: 力度={finalKnockback.magnitude}, 方向={finalKnockback.normalized}");
    }

    /// <summary>
    /// 应用击退效果（触发器版本）
    /// </summary>
    private void ApplyKnockback(GameObject target)
    {
        Rigidbody targetRb = target.GetComponent<Rigidbody>();

        if (targetRb == null) return;

        // 计算击退方向（从伤害源指向玩家）
        Vector3 knockbackDirection = (target.transform.position - transform.position).normalized;

        // 如果开启了反向击退，调整方向
        if (knockbackInOppositeDirection)
        {
            // 对于触发器，我们可以尝试获取玩家的速度
            Vector3 playerVelocity = targetRb.velocity;
            if (playerVelocity.magnitude > 0.1f)
            {
                knockbackDirection = -playerVelocity.normalized;
            }
        }

        // 创建最终的击退力
        Vector3 finalKnockback = knockbackDirection * knockbackForce + Vector3.up * upwardForce;

        // 应用击退力
        targetRb.AddForce(finalKnockback, ForceMode.Impulse);
    }

    private void CreateHitEffect(Collision collision)
    {
        if (hitEffect == null) return;

        Vector3 position = transform.position;
        Quaternion rotation = Quaternion.identity;

        if (collision != null && collision.contacts.Length > 0)
        {
            position = collision.contacts[0].point;
            rotation = Quaternion.LookRotation(collision.contacts[0].normal);
        }
        AudioManager.instance.PlaySFX(1);
        GameObject effect = Instantiate(hitEffect, position, rotation);
        Destroy(effect, 3f); // 3秒后销毁特效
    }
}