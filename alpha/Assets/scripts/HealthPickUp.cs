using UnityEngine;

public class HealthPickup : MonoBehaviour
{
    [Header("治疗设置")]
    [SerializeField] private float healAmount = 25f;
    [SerializeField] private bool fullHeal = false;

    [Header("拾取设置")]
    [SerializeField] private bool destroyOnPickup = true;
    [SerializeField] private string[] canPickupTags = { "Player" };
    [SerializeField] private float respawnTime = 0f; // 0表示不重生

    [Header("视觉效果")]
    [SerializeField] private GameObject pickupEffect;
    [SerializeField] private GameObject modelToDisable; // 拾取后隐藏的模型

    [Header("音频")]
    [SerializeField] private AudioClip pickupSound;

    private bool isActive = true;
    private AudioSource audioSource;

    private void Start()
    {
        // 确保有碰撞体
        if (GetComponent<Collider>() == null)
        {
            gameObject.AddComponent<SphereCollider>().isTrigger = true;
        }

        audioSource = GetComponent<AudioSource>();
        if (audioSource == null && pickupSound != null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!isActive || !IsValidTarget(other.gameObject))
            return;

        // 尝试治疗目标
        bool wasHealed = ApplyHeal(other.gameObject);

        if (wasHealed)
        {
            PlayPickupEffects();

            if (destroyOnPickup)
            {
                Destroy(gameObject);
            }
            else if (respawnTime > 0)
            {
                StartCoroutine(RespawnPickup());
            }
            else
            {
                DisablePickup();
            }
        }
    }

    private bool IsValidTarget(GameObject target)
    {
        foreach (string tag in canPickupTags)
        {
            if (target.CompareTag(tag))
                return true;
        }
        return false;
    }

    private bool ApplyHeal(GameObject target)
    {
        PlayerHealth health = target.GetComponent<PlayerHealth>();

        if (health != null)
        {
            if (fullHeal)
            {
                health.FullHeal();
            }
            else
            {
                health.Heal(healAmount, gameObject);
            }
            return true;
        }

        // 备用方式：发送消息
        if (fullHeal)
        {
            target.SendMessage("FullHeal", SendMessageOptions.DontRequireReceiver);
        }
        else
        {
            target.SendMessage("Heal", healAmount, SendMessageOptions.DontRequireReceiver);
        }

        return true;
    }

    private void PlayPickupEffects()
    {
        // 播放音效
        if (pickupSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(pickupSound);
        }

        // 创建拾取特效
        if (pickupEffect != null)
        {
            GameObject effect = Instantiate(pickupEffect, transform.position, Quaternion.identity);
            Destroy(effect, 3f);
        }
    }

    private void DisablePickup()
    {
        isActive = false;

        // 禁用模型
        if (modelToDisable != null)
            modelToDisable.SetActive(false);

        // 禁用碰撞体
        Collider col = GetComponent<Collider>();
        if (col != null) col.enabled = false;
    }

    private System.Collections.IEnumerator RespawnPickup()
    {
        DisablePickup();

        yield return new WaitForSeconds(respawnTime);

        // 重新启用拾取物
        isActive = true;

        if (modelToDisable != null)
            modelToDisable.SetActive(true);

        Collider col = GetComponent<Collider>();
        if (col != null) col.enabled = true;
    }
}