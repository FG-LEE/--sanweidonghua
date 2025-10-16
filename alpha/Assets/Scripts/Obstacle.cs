using UnityEngine;

public class Obstacle : MonoBehaviour
{
    [Header("碰撞设置")]
    [SerializeField] private LayerMask playerLayer; // 玩家所在层
    [SerializeField] private int maxHits = 3; // 最大碰撞次数（触发游戏结束）
    [SerializeField] private int damageAmount = 1; // 每次碰撞扣除的血量

    [Header("受击反馈")]
    [SerializeField] private float knockbackForce = 5f; // 击退力（会叠加到玩家自身的击退力）

    private int currentHitCount = 0; // 当前碰撞次数

    private void OnTriggerEnter(Collider other)
    {
        // 检查是否碰撞到玩家
        if (((1 << other.gameObject.layer) & playerLayer) != 0)
        {
            HandlePlayerHit(other.gameObject);
        }
    }

    private void HandlePlayerHit(GameObject player)
    {
        PlayerHealth health = player.GetComponent<PlayerHealth>();
        if (health != null && health.CanTakeDamage())
        {
            // 计算击退方向（从障碍物指向玩家）
            Vector3 knockbackDirection = (player.transform.position - transform.position).normalized;

            // 调用玩家受击方法（传递击退方向）
            health.TakeHit(knockbackDirection);

            // 累计碰撞次数
            currentHitCount++;

            // 达到最大碰撞次数时游戏结束
            if (currentHitCount >= maxHits)
            {
                GameOver();
            }
        }
    }

    // 游戏结束处理
    private void GameOver()
    {
        Debug.Log("游戏结束！玩家碰撞障碍物达到最大次数");
        Time.timeScale = 0; // 暂停游戏
        // 如需显示游戏结束UI，可在这里添加逻辑
    }

    // 编辑器中显示障碍物范围
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, GetComponent<Collider>().bounds.extents.magnitude);
    }
}