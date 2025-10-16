using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [Header("移动设置")]
    [SerializeField] private float moveSpeed = 5f;
    [SerializeField] private float jumpForce = 7f;
    [SerializeField] private float rotationSpeed = 10f; // 角色转向速度

    [Header("地面检测")]
    [SerializeField] private Transform groundCheck;
    [SerializeField] private float groundDistance = 0.4f;
    [SerializeField] private LayerMask groundMask;

    private Rigidbody rb;
    private Vector3 movement;
    private bool isGrounded;
    private bool canMove = true;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    private void Update()
    {
        // 检测是否在地面上
        isGrounded = Physics.CheckSphere(groundCheck.position, groundDistance, groundMask);

        // 跳跃输入
        if (Input.GetButtonDown("Jump") && isGrounded && canMove)
        {
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
        }
    }

    private void FixedUpdate()
    {
        if (!canMove) return;

        // 获取移动输入
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical"); // 横板游戏可能不需要Z轴，可设为0

        // 计算移动方向（横板游戏通常只需要X轴左右移动）
        movement = new Vector3(x, 0f, 0f).normalized;

        // 移动角色
        if (movement.magnitude >= 0.1f)
        {
            Vector3 moveVelocity = movement * moveSpeed;
            // 保持Y轴速度不变（用于重力和跳跃）
            moveVelocity.y = rb.velocity.y;
            rb.velocity = moveVelocity;

            // 角色转向移动方向
            Quaternion targetRotation = Quaternion.LookRotation(movement);
            transform.rotation = Quaternion.Lerp(transform.rotation, targetRotation, rotationSpeed * Time.fixedDeltaTime);
        }
        else
        {
            // 停止移动时保持Y轴速度
            rb.velocity = new Vector3(0f, rb.velocity.y, 0f);
        }
    }

    // 用于硬直时禁用移动
    public void SetCanMove(bool value)
    {
        canMove = value;
    }

    // 绘制地面检测球的Gizmos
    private void OnDrawGizmos()
    {
        if (groundCheck != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(groundCheck.position, groundDistance);
        }
    }
}
