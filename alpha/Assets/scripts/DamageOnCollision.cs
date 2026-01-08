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

        // 销毁自身（如果需要）
        if (destroyOnCollision)
            Destroy(gameObject);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!IsValidTarget(other.gameObject))
            return;

        ApplyDamage(other.gameObject, damageAmount);

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

        GameObject effect = Instantiate(hitEffect, position, rotation);
        Destroy(effect, 3f); // 3秒后销毁特效
    }
}