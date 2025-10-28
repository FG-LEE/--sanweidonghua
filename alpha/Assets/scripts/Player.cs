using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    // 组件引用
    public Rigidbody rb;                    // 刚体组件，用于物理运动
    [SerializeField] private Animator anime; // 动画控制器，用于角色动画
    private bool isMoving;                  // 是否正在移动的标志

    // ========== 移动相关变量 ==========
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 8f;        // 基础移动速度
    [SerializeField] private float acceleration = 15f;    // 加速系数，值越大加速越快
    [SerializeField] private float deceleration = 10f;    // 减速系数，值越大减速越快
    private float currentHorizontalSpeed;   // 当前水平速度，用于平滑过渡
    private float xInput;                   // 水平输入值 (-1, 0, 1)
    private int faceDir = 1;                // 面向方向 (1:右, -1:左)
    private bool faceRight = true;          // 是否面向右侧

    // ========== 跳跃相关变量 ==========
    [Header("Jump Settings")]
    [SerializeField] private float jumpForce = 13f;       // 跳跃力度
    [SerializeField] private float maxJumpHeight = 4f;    // 最大跳跃高度
    [SerializeField] private float minJumpHeight = 1f;    // 最小跳跃高度（小跳）
    [SerializeField] private int maxJumpCount = 2;        // 最大跳跃次数（二段跳）
    [SerializeField] private float jumpBufferTime = 0.15f; // 跳跃缓冲时间（提前按键有效时间）
    [SerializeField] private float coyoteTime = 0.1f;     // 土狼时间（离开平台后仍可跳跃的时间）

    // 跳跃状态变量
    private int currentJumpCount = 0;       // 当前跳跃次数
    private float jumpBufferCounter;        // 跳跃缓冲计时器
    private float coyoteTimeCounter;        // 土狼时间计时器
    private bool isJumping = false;         // 是否正在跳跃
    private float jumpStartY;               // 跳跃起始Y坐标（用于计算跳跃高度）

    // ========== 重力与下落相关变量 ==========
    [Header("Gravity & Fall Settings")]
    [SerializeField] private float riseGravityScale = 1f;      // 上升阶段重力系数
    [SerializeField] private float fallGravityScale = 2.2f;    // 下落阶段重力系数
    [SerializeField] private float fastFallGravityScale = 3.5f; // 快速下落重力系数
    [SerializeField] private float maxFallSpeed = -25f;        // 最大下落速度限制
    [SerializeField] private float lowJumpMultiplier = 1.8f;   // 小跳时的重力系数
    private bool isFastFalling = false;     // 是否正在快速下落

    // ========== 冲刺相关变量 ==========
    [Header("Dash Settings")]
    [SerializeField] private float dashDuration = 0.2f;   // 冲刺持续时间
    [SerializeField] private float dashSpeed = 2f;        // 冲刺速度倍数
    private float dashTime;                // 冲刺剩余时间

    // ========== 碰撞检测相关变量 ==========
    [Header("Collision Detection")]
    [SerializeField] private LayerMask whatIsGround;          // 地面层级掩码
    [SerializeField] private float groundCheckDistance = 0.1f; // 地面检测距离
    private bool isGround;                 // 是否在地面上

    // ========== 生命周期方法 ==========

    /// <summary>
    /// 初始化方法，在游戏开始时调用一次
    /// </summary>
    void Start()
    {
        // 获取组件引用
        rb = GetComponent<Rigidbody>();
        anime = GetComponent<Animator>();

        // 初始化刚体设置
        rb.useGravity = false; // 禁用默认重力，使用自定义重力系统
    }

    /// <summary>
    /// 每帧更新，用于处理输入和非物理相关的逻辑
    /// </summary>
    void Update()
    {
        GetInput();             // 获取玩家输入
        HandleTimers();         // 更新各种计时器
        HandleJumpInput();      // 处理跳跃输入
        HandleDashInput();      // 处理冲刺输入
        UpdateAnimations();     // 更新动画状态
    }

    /// <summary>
    /// 固定时间步长更新，用于物理相关的计算
    /// 保证物理计算的稳定性，不受帧率影响
    /// </summary>
    void FixedUpdate()
    {
        GroundCheck();          // 地面碰撞检测
        HandleMovement();       // 处理移动逻辑
        HandleJump();           // 处理跳跃逻辑
        HandleGravity();        // 应用自定义重力
        ClampFallSpeed();       // 限制下落速度
        FlipController();       // 控制角色翻转
    }

    // ========== 输入处理与计时器管理 ==========

    /// <summary>
    /// 获取玩家输入
    /// </summary>
    private void GetInput()
    {
        // 获取水平输入，返回值在 -1（左）到 1（右）之间
        xInput = Input.GetAxisRaw("Horizontal");
    }

    /// <summary>
    /// 管理各种计时器的更新
    /// </summary>
    private void HandleTimers()
    {
        // 跳跃缓冲计时器：允许玩家在落地前提前按下跳跃键
        jumpBufferCounter -= Time.deltaTime;

        // 土狼时间计时器：允许玩家在离开平台后短时间内仍可跳跃
        if (isGround)
        {
            coyoteTimeCounter = coyoteTime; // 在地面上时重置土狼时间
        }
        else
        {
            coyoteTimeCounter -= Time.deltaTime; // 在空中时递减计时器
        }

        // 冲刺计时器
        dashTime -= Time.deltaTime;
    }

    /// <summary>
    /// 处理跳跃相关的输入检测
    /// </summary>
    private void HandleJumpInput()
    {
        // 检测跳跃键按下，设置跳跃缓冲
        if (Input.GetKeyDown(KeyCode.Space))
        {
            jumpBufferCounter = jumpBufferTime;
        }

        // 检测快速下落输入（按下S键或下方向键）
        isFastFalling = (Input.GetKey(KeyCode.S) || Input.GetKey(KeyCode.DownArrow)) &&
                        !isGround && rb.velocity.y < 0;
    }

    /// <summary>
    /// 处理冲刺输入
    /// </summary>
    private void HandleDashInput()
    {
        if (Input.GetKeyDown(KeyCode.LeftShift))
        {
            dashTime = dashDuration; // 开始冲刺
        }
    }

    // ========== 移动控制系统 ==========

    /// <summary>
    /// 处理角色移动逻辑，包含平滑加速和冲刺
    /// </summary>
    private void HandleMovement()
    {
        // 计算目标速度
        float targetSpeed = xInput * moveSpeed;

        // 使用 Lerp 实现平滑加速和减速
        if (Mathf.Abs(xInput) > 0.1f) // 有输入时加速
        {
            // Mathf.Lerp: 从当前速度平滑过渡到目标速度
            // acceleration * Time.fixedDeltaTime: 控制过渡速度
            currentHorizontalSpeed = Mathf.Lerp(currentHorizontalSpeed, targetSpeed, acceleration * Time.fixedDeltaTime);
        }
        else // 无输入时减速
        {
            // 平滑减速到0
            currentHorizontalSpeed = Mathf.Lerp(currentHorizontalSpeed, 0f, deceleration * Time.fixedDeltaTime);
        }

        // 冲刺逻辑：在冲刺时间内应用冲刺速度
        if (dashTime > 0)
        {
            // 冲刺时朝面向方向移动，速度为基础速度乘以冲刺倍数
            currentHorizontalSpeed = faceDir * moveSpeed * dashSpeed;
        }

        // 应用计算后的速度到刚体
        // 只修改X轴速度，保持Y轴（跳跃/下落）和Z轴速度不变
        rb.velocity = new Vector3(currentHorizontalSpeed, rb.velocity.y, rb.velocity.z);
    }

    /// <summary>
    /// 控制角色朝向
    /// 根据移动方向自动翻转角色 sprite
    /// </summary>
    private void FlipController()
    {
        // 向右移动且当前面向左时翻转
        if (currentHorizontalSpeed > 0.1f && !faceRight)
        {
            Flip();
        }
        // 向左移动且当前面向右时翻转
        else if (currentHorizontalSpeed < -0.1f && faceRight)
        {
            Flip();
        }
    }

    /// <summary>
    /// 执行角色翻转
    /// </summary>
    private void Flip()
    {
        faceDir *= -1;          // 反转面向方向
        faceRight = !faceRight; // 更新面向状态

        // 通过旋转实现视觉上的翻转
        // 绕Y轴旋转180度
        transform.Rotate(0, 180, 0);
    }

    // ========== 跳跃控制系统 ==========

    /// <summary>
    /// 处理跳跃逻辑，包含跳跃缓冲和土狼时间
    /// </summary>
    private void HandleJump()
    {
        // 重置跳跃状态：当角色在地面上且正在下落或静止时
        if (isGround && rb.velocity.y <= 0)
        {
            currentJumpCount = 0;    // 重置跳跃计数
            isJumping = false;       // 标记为非跳跃状态
        }

        // 执行跳跃条件检查：跳跃缓冲有效且可以跳跃
        if (jumpBufferCounter > 0 && CanJump())
        {
            ExecuteJump(); // 执行跳跃
        }

        // 小跳机制：松开跳跃键时减少上升速度
        // 实现可变跳跃高度（按得久跳得高，按得短跳得低）
        if (isJumping && rb.velocity.y > 0 && !Input.GetKey(KeyCode.Space))
        {
            // 立即减少Y轴速度，实现小跳效果
            rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y * 0.5f, rb.velocity.z);
        }
    }

    /// <summary>
    /// 检查是否可以进行跳跃
    /// 考虑了土狼时间和多段跳
    /// </summary>
    /// <returns>是否可以跳跃</returns>
    private bool CanJump()
    {
        // 第一段跳条件：在地面上或土狼时间内，且尚未开始跳跃
        bool canFirstJump = (isGround || coyoteTimeCounter > 0) && currentJumpCount == 0;

        // 多段跳条件：在空中且跳跃次数未达上限
        bool canMultiJump = !isGround && currentJumpCount < maxJumpCount;

        return canFirstJump || canMultiJump;
    }

    /// <summary>
    /// 执行跳跃动作
    /// </summary>
    private void ExecuteJump()
    {
        // 记录跳跃起始位置（用于计算跳跃高度限制）
        if (currentJumpCount == 0)
        {
            jumpStartY = transform.position.y;
        }

        // 重置垂直速度，确保每次跳跃高度一致
        // 先归零再施加跳跃力，避免累积速度的影响
        rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);

        // 应用跳跃速度
        rb.velocity = new Vector3(rb.velocity.x, jumpForce, rb.velocity.z);

        // 更新跳跃状态
        currentJumpCount++;          // 增加跳跃计数
        jumpBufferCounter = 0;       // 清除跳跃缓冲
        coyoteTimeCounter = 0;       // 清除土狼时间
        isJumping = true;            // 标记为跳跃状态
        isFastFalling = false;       // 重置快速下落状态

        // 播放跳跃音效
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(1); // 假设1是跳跃音效的索引
        }
    }

    /// <summary>
    /// 计算当前跳跃高度（用于调试或UI显示）
    /// </summary>
    /// <returns>当前跳跃高度</returns>
    private float GetCurrentJumpHeight()
    {
        if (!isJumping) return 0f;

        // 使用 Clamp 限制计算范围在 0 到 maxJumpHeight 之间
        return Mathf.Clamp(transform.position.y - jumpStartY, 0, maxJumpHeight);
    }

    // ========== 重力与下落控制系统 ==========

    /// <summary>
    /// 处理重力应用，实现自定义重力系统
    /// </summary>
    private void HandleGravity()
    {
        // 获取当前重力系数
        float gravityScale = GetCurrentGravityScale();

        // 计算重力向量
        Vector3 gravity = Physics.gravity * gravityScale;

        // 应用重力到刚体速度
        // 下落时应用完整重力，上升时应用一半重力（更自然的跳跃弧线）
        if (rb.velocity.y < 0) // 下落阶段
        {
            rb.velocity += gravity * Time.fixedDeltaTime;
        }
        else // 上升阶段
        {
            rb.velocity += gravity * Time.fixedDeltaTime * 0.5f;
        }
    }

    /// <summary>
    /// 根据角色状态获取当前重力系数
    /// 使用 Lerp 实现重力系数的平滑过渡
    /// </summary>
    /// <returns>当前重力系数</returns>
    private float GetCurrentGravityScale()
    {
        if (isFastFalling) // 快速下落状态
        {
            // 使用 Lerp 从普通下落重力平滑过渡到快速下落重力
            return Mathf.Lerp(fallGravityScale, fastFallGravityScale, 0.8f);
        }
        else if (rb.velocity.y < 0) // 普通下落状态
        {
            // 从上升重力平滑过渡到下落重力
            return Mathf.Lerp(riseGravityScale, fallGravityScale, 0.5f);
        }
        else if (rb.velocity.y > 0 && !Input.GetKey(KeyCode.Space)) // 小跳状态
        {
            // 应用小跳重力系数，实现快速下落
            return Mathf.Lerp(riseGravityScale, lowJumpMultiplier, 0.7f);
        }
        else // 正常上升状态
        {
            return riseGravityScale;
        }
    }

    /// <summary>
    /// 限制下落速度，防止下落过快
    /// 使用 Clamp 确保速度在合理范围内
    /// </summary>
    private void ClampFallSpeed()
    {
        // 使用 Mathf.Clamp 限制Y轴速度不低于最大下落速度
        // 第一个参数：要限制的值（当前Y速度）
        // 第二个参数：最小值（最大下落速度，为负值）
        // 第三个参数：最大值（无穷大，不限制上升速度）
        float clampedYVelocity = Mathf.Clamp(rb.velocity.y, maxFallSpeed, Mathf.Infinity);

        // 应用限制后的速度
        rb.velocity = new Vector3(rb.velocity.x, clampedYVelocity, rb.velocity.z);

        // 限制最大跳跃高度
        // 当跳跃高度超过限制且仍在上升时，立即停止上升
        if (isJumping && transform.position.y - jumpStartY >= maxJumpHeight && rb.velocity.y > 0)
        {
            rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);
        }
    }

    // ========== 碰撞检测与动画系统 ==========

    /// <summary>
    /// 地面检测，使用射线检测判断是否在地面上
    /// </summary>
    private void GroundCheck()
    {
        bool wasGround = isGround; // 记录之前的地面状态

        // 从角色位置向下发射射线检测地面
        isGround = Physics.Raycast(transform.position, Vector3.down, groundCheckDistance, whatIsGround);

        // 落地检测：从空中落到地面时触发
        if (!wasGround && isGround && rb.velocity.y <= 0)
        {
            OnLand(); // 调用落地处理
        }
    }

    /// <summary>
    /// 落地时的处理函数
    /// </summary>
    private void OnLand()
    {
        // 根据下落速度播放不同的落地音效
        if (AudioManager.instance != null && rb.velocity.y < -5f)
        {
            AudioManager.instance.PlaySFX(2); // 假设2是落地音效的索引
        }
    }

    /// <summary>
    /// 更新动画状态和参数
    /// 使用 Lerp 实现动画参数的平滑过渡
    /// </summary>
    private void UpdateAnimations()
    {
        // 判断是否在移动（水平速度大于阈值）
        isMoving = Mathf.Abs(currentHorizontalSpeed) > 0.1f;

        // 使用 Lerp 平滑过渡动画速度参数
        // 从当前动画值平滑过渡到目标值，避免动画突变
        float smoothedSpeed = Mathf.Lerp(anime.GetFloat("Speed"), Mathf.Abs(xInput), 5f * Time.deltaTime);

        // 设置动画参数
        anime.SetFloat("Speed", smoothedSpeed);        // 移动速度（平滑后）
        anime.SetBool("isMoving", isMoving);           // 是否在移动
        anime.SetBool("isGround", isGround);           // 是否在地面
        anime.SetFloat("yVelocity", rb.velocity.y);    // Y轴速度（用于跳跃/下落动画）
        anime.SetInteger("jumpCount", currentJumpCount); // 跳跃次数
        anime.SetBool("isFastFalling", isFastFalling); // 是否快速下落
    }

    // ========== 调试与可视化 ==========

    /// <summary>
    /// 在Scene视图中绘制调试图形
    /// </summary>
    private void OnDrawGizmos()
    {
        // 绘制地面检测线
        // 在地面上显示绿色，在空中显示红色
        Gizmos.color = isGround ? Color.green : Color.red;
        Gizmos.DrawLine(transform.position, transform.position + Vector3.down * groundCheckDistance);

        // 在游戏运行时绘制跳跃高度可视化
        if (Application.isPlaying && isJumping)
        {
            Gizmos.color = Color.yellow;
            float currentHeight = GetCurrentJumpHeight();

            // 绘制跳跃高度框
            Gizmos.DrawWireCube(
                transform.position + Vector3.up * (currentHeight * 0.5f), // 中心位置
                new Vector3(0.5f, currentHeight, 0.5f)                   // 大小
            );
        }
    }

    /// <summary>
    /// 在Game视图中显示调试信息
    /// </summary>
    private void OnGUI()
    {
        if (!Application.isPlaying) return;

        // 创建调试信息显示区域
        GUILayout.BeginArea(new Rect(10, 10, 300, 200));
        GUILayout.Label($"Y Velocity: {rb.velocity.y:F2}");          // Y轴速度
        GUILayout.Label($"Jump Count: {currentJumpCount}/{maxJumpCount}"); // 跳跃计数
        GUILayout.Label($"Grounded: {isGround}");                    // 地面状态
        GUILayout.Label($"Coyote Time: {coyoteTimeCounter:F2}");     // 土狼时间
        GUILayout.Label($"Jump Buffer: {jumpBufferCounter:F2}");     // 跳跃缓冲
        GUILayout.Label($"Fast Falling: {isFastFalling}");           // 快速下落
        GUILayout.EndArea();
    }
}