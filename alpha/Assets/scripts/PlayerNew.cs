using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerNew : MonoBehaviour
{
    // 组件引用
    public Rigidbody rb;                    // 刚体组件，用于物理运动
    [SerializeField] private Animator anime; // 动画控制器，用于角色动画
    [SerializeField] private Transform characterModel; // 角色模型引用
    private bool isMoving;                  // 是否正在移动的标志

    // ========== 移动相关变量 ==========
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 8f;        // 基础移动速度
    private float xInput;                   // 水平输入值 (-1, 0, 1)
    private int faceDir = 1;                // 面向方向 (1:右, -1:左)
    private bool faceRight = true;          // 是否面向右侧
    private bool isPlayingFootstep = false; // 是否正在播放脚步声

    // ========== 跳跃相关变量 ==========
    [Header("Jump Settings")]
    [SerializeField] private float jumpForce = 13f;       // 跳跃力度
    [SerializeField] private float maxJumpHeight = 4f;    // 最大跳跃高度
    [SerializeField] private int maxJumpCount = 2;        // 最大跳跃次数（二段跳）
    [SerializeField] private float jumpBufferTime = 0.15f; // 跳跃缓冲时间（提前按键有效时间）
    [SerializeField] private float coyoteTime = 0.1f;     // 土狼时间（离开平台后仍可跳跃的时间）

    // 跳跃状态变量
    private int currentJumpCount = 0;       // 当前跳跃次数
    private float jumpBufferCounter;        // 跳跃缓冲计时器
    private float coyoteTimeCounter;        // 土狼时间计时器
    private bool isJumping = false;         // 是否正在跳跃
    private float[] jumpStartY;             // 每段跳跃的起始Y坐标
    private bool[] jumpHeightReached;       // 每段跳跃是否已达到最大高度

    // ========== 重力与下落相关变量 ==========
    [Header("Gravity & Fall Settings")]
    [SerializeField] private float riseGravityScale = 1f;      // 上升阶段重力系数
    [SerializeField] private float fallGravityScale = 2.2f;    // 下落阶段重力系数
    [SerializeField] private float fastFallGravityScale = 3.5f; // 快速下落重力系数
    [SerializeField] private float maxFallSpeed = -25f;        // 最大下落速度限制
    private bool isFastFalling = false;     // 是否正在快速下落

    // ========== 冲刺相关变量 ==========
    [Header("Dash Settings")]
    [SerializeField] private float dashDuration = 0.2f;   // 冲刺持续时间
    [SerializeField] private float dashSpeed = 2f;        // 冲刺速度倍数
    private float dashTime;                // 冲刺剩余时间
    private bool isDashing = false;        // 是否正在冲刺

    // ========== 碰撞检测相关变量 ==========
    [Header("Collision Detection")]
    [SerializeField] private LayerMask whatIsGround;          // 地面层级掩码
    [SerializeField] private float groundCheckDistance = 0.1f; // 地面检测距离
    [SerializeField] private Vector3 groundCheckOffset = Vector3.zero; // 地面检测偏移
    private bool isGround;                 // 是否在地面上

    // ========== 墙壁滑行相关变量 ==========
    [Header("Wall Slide Settings")]
    [SerializeField] private LayerMask whatIsWall;            // 墙壁层级掩码
    [SerializeField] private float wallCheckDistance = 0.5f;  // 墙壁检测距离
    [SerializeField] private Vector3 wallCheckOffset = new Vector3(0, 1.6f, 0); // 墙壁检测偏移
    [SerializeField] private float wallSlideSpeed = 2f;       // 墙壁滑行速度
    [SerializeField] private float wallJumpForce = 10f;       // 墙壁跳跃力度
    [SerializeField] private Vector2 wallJumpDirection = new Vector2(1f, 1.5f); // 墙壁跳跃方向
    private bool isTouchingWall;           // 是否接触墙壁
    private bool isWallSliding;            // 是否正在墙壁滑行
    private bool isTouchingRightWall;      // 是否接触右侧墙壁
    private bool isTouchingLeftWall;       // 是否接触左侧墙壁
    private bool wallSlideInput;           // 墙壁滑行输入标志

    // ========== 生命周期方法 ==========

    /// <summary>
    /// 初始化方法，在游戏开始时调用一次
    /// </summary>
    void Start()
    {
        // 获取组件引用
        rb = GetComponent<Rigidbody>();

        // 获取角色模型引用（子物体）
        if (characterModel == null)
        {
            // 如果没有指定，尝试从子物体中查找
            if (transform.childCount > 0)
            {
                characterModel = transform.GetChild(0);
            }
            else
            {
                Debug.LogError("Character Model not assigned and no child objects found!");
            }
        }

        // 从角色模型中获取动画组件
        if (characterModel != null)
        {
            anime = characterModel.GetComponent<Animator>();
            if (anime == null)
            {
                Debug.LogWarning("Animator component not found on character model!");
            }
        }

        // 初始化跳跃相关数组
        jumpStartY = new float[maxJumpCount];
        jumpHeightReached = new bool[maxJumpCount];
        for (int i = 0; i < maxJumpCount; i++)
        {
            jumpHeightReached[i] = false;
        }

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
        WallCheck();            // 墙壁碰撞检测
        HandleMovement();       // 处理移动逻辑
        HandleJump();           // 处理跳跃逻辑
        HandleWallSlide();      // 处理墙壁滑行逻辑
        HandleGravity();        // 应用自定义重力
        HandleFallSpeed();      // 处理下落速度
        FlipController();       // 控制角色翻转
        CheckJumpHeight();      // 检查每段跳跃高度限制
    }

    // ========== 输入处理与计时器管理 ==========

    /// <summary>
    /// 获取玩家输入
    /// </summary>
    private void GetInput()
    {
        // 获取水平输入，返回值在 -1（左）到 1（右）之间
        float previousInput = xInput;
        xInput = Input.GetAxisRaw("Horizontal");
        bool wasMoving = Mathf.Abs(previousInput) > 0.1f;
        bool isMovingNow = Mathf.Abs(xInput) > 0.1f;

        // 检查是否在地面上
        bool canPlayFootstep = isGround && !isWallSliding;

        // 开始移动且在地面上时播放音效
        if (!wasMoving && isMovingNow && canPlayFootstep)
        {
            AudioManager.instance.PlaySFX(0);
            isPlayingFootstep = true;
        }
        // 持续移动且在地面上时：如果之前没在播放，开始播放
        else if (isMovingNow && canPlayFootstep && !isPlayingFootstep)
        {
            AudioManager.instance.PlaySFX(0);
            isPlayingFootstep = true;
        }
        // 停止移动时停止音效
        else if (wasMoving && !isMovingNow && isPlayingFootstep)
        {
            AudioManager.instance.StopSFX(0);
            isPlayingFootstep = false;
        }
        // 离开地面时停止音效
        else if (!canPlayFootstep && isPlayingFootstep)
        {
            AudioManager.instance.StopSFX(0);
            isPlayingFootstep = false;
        }

        // 检测墙壁滑行输入（按下方向键朝向墙壁）
        bool rightWallInput = (xInput > 0);
        bool leftWallInput = (xInput < 0);

        wallSlideInput = (isTouchingRightWall && rightWallInput) ||
                         (isTouchingLeftWall && leftWallInput);
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
            // 墙壁跳跃检测
            if (isWallSliding)
            {
                ExecuteWallJump();
            }
            else
            {
                jumpBufferCounter = jumpBufferTime;
            }
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
        if (Input.GetKeyDown(KeyCode.LeftShift) && !isDashing)
        {
            StartDash();
        }

        // 更新冲刺计时器
        if (isDashing)
        {
            dashTime -= Time.deltaTime;
            if (dashTime <= 0)
            {
                EndDash();
            }
        }
    }

    /// <summary>
    /// 开始冲刺
    /// </summary>
    private void StartDash()
    {
        isDashing = true;
        dashTime = dashDuration;
        Debug.Log($"设置动画参数：isDashing={anime.GetBool("isDashing")}");
        // 播放冲刺特效
        if (VfxManager.instance != null)
        {
            VfxManager.instance.PlayVFX(0, this.transform.position);
        }

        // 播放冲刺音效（可选）
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(3); // 假设3是冲刺音效的索引
        }
        
    }
    /// <summary>
    /// 结束冲刺
    /// </summary>
    private void EndDash()
    {
        isDashing = false;
        Debug.Log($"设置动画参数：isDashing={anime.GetBool("isDashing")}");
    }



    // ========== 移动控制系统 ==========

    /// <summary>
    /// 处理角色移动逻辑 - 简化版本
    /// </summary>
    private void HandleMovement()
    {
        // 墙壁滑行时限制水平移动
        if (isWallSliding)
        {
            // 墙壁滑行时保持水平速度为零，只允许垂直滑行
            rb.velocity = new Vector3(0, rb.velocity.y, rb.velocity.z);
            return;
        }

        // 冲刺逻辑：在冲刺时间内应用冲刺速度
        if (isDashing)
        {
            // 冲刺时朝面向方向移动，速度为基础速度乘以冲刺倍数
            float dashTargetSpeed = faceDir * moveSpeed * dashSpeed;
            rb.velocity = new Vector3(dashTargetSpeed, rb.velocity.y, rb.velocity.z);
        }
        else
        {
            // 正常移动
            float targetSpeed = xInput * moveSpeed;
            rb.velocity = new Vector3(targetSpeed, rb.velocity.y, rb.velocity.z);
        }
    }

    /// <summary>
    /// 控制角色朝向
    /// 根据移动方向自动翻转角色 sprite
    /// </summary>
    private void FlipController()
    {
        // 墙壁滑行时不允许翻转
        if (isWallSliding) return;

        // 向右移动且当前面向左时翻转
        if (xInput > 0.1f && !faceRight)
        {
            Flip();
        }
        // 向左移动且当前面向右时翻转
        else if (xInput < -0.1f && faceRight)
        {
            Flip();
        }
    }

    /// <summary>
    /// 执行角色翻转（只翻转子物体）
    /// </summary>
    private void Flip()
    {
        faceDir *= -1;          // 反转面向方向
        faceRight = !faceRight; // 更新面向状态

        // 只翻转角色模型，不翻转父物体
        if (characterModel != null)
        {
            // 通过旋转实现视觉上的翻转
            characterModel.Rotate(0, 180, 0);
        }
    }

    // ========== 跳跃控制系统 ==========

    /// <summary>
    /// 处理跳跃逻辑，包含跳跃缓冲和土狼时间
    /// </summary>
    private void HandleJump()
    {
        if (isDashing) return;
        // 重置跳跃状态：当角色在地面上且正在下落或静止时
        if (isGround && rb.velocity.y <= 0)
        {
            currentJumpCount = 0;    // 重置跳跃计数
            isJumping = false;       // 标记为非跳跃状态

            // 重置所有跳跃高度限制状态
            for (int i = 0; i < maxJumpCount; i++)
            {
                jumpHeightReached[i] = false;
            }
        }

        // 执行跳跃条件检查：跳跃缓冲有效且可以跳跃（墙壁滑行时不允许普通跳跃）
        if (jumpBufferCounter > 0 && CanJump() && !isWallSliding)
        {
            ExecuteJump(); // 执行跳跃
        }

        // 小跳机制：松开跳跃键时减少上升速度
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
        // 记录当前跳跃段的起始位置
        jumpStartY[currentJumpCount] = transform.position.y;
        jumpHeightReached[currentJumpCount] = false;

        // 重置垂直速度，确保每次跳跃高度一致
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
       
    }

    /// <summary>
    /// 执行墙壁跳跃
    /// </summary>
    private void ExecuteWallJump()
    {
        // 确定墙壁跳跃的方向
        int jumpDirection;


        // 检查是否有水平输入
        if (Mathf.Abs(xInput) > 0.1f)
        {
            // 有输入：根据输入方向跳跃
            jumpDirection = xInput > 0 ? 1 : -1;
        }
        else
        {
            // 没有输入：保持当前朝向
            jumpDirection = faceDir;
        }

        

        // 计算墙壁跳跃速度
        Vector2 jumpVelocity = new Vector2(wallJumpDirection.x * jumpDirection, wallJumpDirection.y);
        jumpVelocity.Normalize(); // 标准化向量
        jumpVelocity *= wallJumpForce;

        // 应用墙壁跳跃速度
        rb.velocity = new Vector3(jumpVelocity.x, jumpVelocity.y, rb.velocity.z);

        // 更新角色朝向
        if (jumpDirection != faceDir)
        {
            Flip();
        }

        // 重置状态
        isWallSliding = false;
        isJumping = true;
        currentJumpCount = 1; // 墙壁跳跃算作第一段跳跃

        // 播放跳跃音效
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(1);
        }
    }

    /// <summary>
    /// 检查每段跳跃的高度限制
    /// </summary>
    private void CheckJumpHeight()
    {
        if (!isJumping || currentJumpCount == 0) return;

        // 检查当前跳跃段的高度限制
        int currentJumpIndex = currentJumpCount - 1;

        if (!jumpHeightReached[currentJumpIndex] &&
            transform.position.y - jumpStartY[currentJumpIndex] >= maxJumpHeight &&
            rb.velocity.y > 0)
        {
            // 当前跳跃段已达到最大高度，限制上升速度
            rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);
            jumpHeightReached[currentJumpIndex] = true;
        }
    }

    // ========== 墙壁滑行控制系统 ==========

    /// <summary>
    /// 墙壁检测，使用3D射线检测判断是否接触墙壁
    /// </summary>
    private void WallCheck()
    {
        // 计算墙壁检测位置（父物体位置 + 偏移量）
        Vector3 wallDetectionPoint = transform.position + wallCheckOffset;

        // 3D射线检测右侧墙壁（从计算位置检测）
        RaycastHit rightHit;
        isTouchingRightWall = Physics.Raycast(wallDetectionPoint, Vector3.right, out rightHit, wallCheckDistance, whatIsWall) && faceRight;

        // 3D射线检测左侧墙壁（从计算位置检测）
        RaycastHit leftHit;
        isTouchingLeftWall = Physics.Raycast(wallDetectionPoint, Vector3.left, out leftHit, wallCheckDistance, whatIsWall) && !faceRight;

        // 更新墙壁接触状态
        isTouchingWall = isTouchingRightWall || isTouchingLeftWall;

        // 检查是否应该开始墙壁滑行（按下触发模式）
        if (!isGround && isTouchingWall && !isWallSliding && wallSlideInput)
        {
            isWallSliding = true;
        }

        // 检查是否应该结束墙壁滑行（落地或离开墙壁时自动结束）
        if (isWallSliding)
        {
            bool shouldStopWallSlide = isGround || !isTouchingWall;

            if (shouldStopWallSlide)
            {
                isWallSliding = false;
            }
        }

        // 重置墙壁滑行输入标志（确保只触发一次）
        wallSlideInput = false;
    }

    /// <summary>
    /// 处理墙壁滑行逻辑
    /// </summary>
    private void HandleWallSlide()
    {
        if (isWallSliding)
        {
            // 限制下落速度为墙壁滑行速度
            if (rb.velocity.y < -wallSlideSpeed)
            {
                rb.velocity = new Vector3(rb.velocity.x, -wallSlideSpeed, rb.velocity.z);
            }
        }
    }

    // ========== 重力与下落控制系统 ==========

    /// <summary>
    /// 处理重力应用，实现自定义重力系统
    /// </summary>
    private void HandleGravity()
    {
        // 墙壁滑行时使用较小的重力
        if (isWallSliding)
        {
            // 墙壁滑行时使用较小的重力系数
            float wallSlideGravityScale = 0.5f;
            Vector3 wallSlideGravity = Physics.gravity * wallSlideGravityScale;
            rb.velocity += wallSlideGravity * Time.fixedDeltaTime;
            return;
        }

        // 获取当前重力系数
        float gravityScale = GetCurrentGravityScale();

        // 计算重力向量并应用
        Vector3 normalGravity = Physics.gravity * gravityScale;
        rb.velocity += normalGravity * Time.fixedDeltaTime;
    }

    /// <summary>
    /// 根据角色状态获取当前重力系数
    /// </summary>
    /// <returns>当前重力系数</returns>
    private float GetCurrentGravityScale()
    {
        if (isFastFalling) // 快速下落状态
        {
            return fastFallGravityScale;
        }
        else if (rb.velocity.y < 0) // 普通下落状态
        {
            return fallGravityScale;
        }
        else // 上升状态
        {
            return riseGravityScale;
        }
    }

    /// <summary>
    /// 处理下落速度限制
    /// </summary>
    private void HandleFallSpeed()
    {
        // 墙壁滑行时已经有速度限制，跳过最大下落速度检查
        if (isWallSliding) return;

        // 如果下落速度超过最大限制，直接设置为最大下落速度
        if (rb.velocity.y < maxFallSpeed)
        {
            rb.velocity = new Vector3(rb.velocity.x, maxFallSpeed, rb.velocity.z);
        }
    }

    // ========== 碰撞检测与动画系统 ==========

    /// <summary>
    /// 地面检测，使用3D射线检测判断是否在地面上
    /// </summary>
    private void GroundCheck()
    {
        bool wasGround = isGround; // 记录之前的地面状态

        // 计算地面检测位置（父物体位置 + 偏移量）
        Vector3 groundDetectionPoint = transform.position + groundCheckOffset;

        // 从计算位置向下发射3D射线检测地面
        RaycastHit hit;
        isGround = Physics.Raycast(groundDetectionPoint, Vector3.down, out hit, groundCheckDistance, whatIsGround);

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
    /// </summary>
    private void UpdateAnimations()
    {
        // 判断是否在移动（基于输入而不是实际速度）
        isMoving = Mathf.Abs(xInput) > 0.1f;

        // 直接设置动画参数，没有平滑过渡
        if (anime != null)
        {
            anime.SetFloat("Speed", Mathf.Abs(xInput));  // 移动速度（直接使用输入值）
            anime.SetBool("isMoving", isMoving);         // 是否在移动
            anime.SetBool("isGround", isGround);         // 是否在地面
            anime.SetBool("isWallSliding", isWallSliding); // 是否在墙壁滑行
            anime.SetBool("isDashing", isDashing);       // 是否在冲刺（新增）
            anime.SetFloat("ySpeed", rb.velocity.y);
        }
    }

    // ========== 调试与可视化 ==========

    /// <summary>
    /// 在Scene视图中绘制调试图形
    /// </summary>
    private void OnDrawGizmos()
    {
        // 计算检测点位置
        Vector3 groundDetectionPoint = transform.position + groundCheckOffset;
        Vector3 wallDetectionPoint = transform.position + wallCheckOffset;

        // 绘制地面检测线
        Gizmos.color = isGround ? Color.green : Color.red;
        Gizmos.DrawLine(groundDetectionPoint, groundDetectionPoint + Vector3.down * groundCheckDistance);
        Gizmos.DrawSphere(groundDetectionPoint, 0.05f); // 显示检测点

        // 绘制墙壁检测线
        Gizmos.color = isTouchingWall ? Color.blue : Color.white;
        Gizmos.DrawLine(wallDetectionPoint, wallDetectionPoint + Vector3.right * wallCheckDistance);
        Gizmos.DrawLine(wallDetectionPoint, wallDetectionPoint + Vector3.left * wallCheckDistance);
        Gizmos.DrawSphere(wallDetectionPoint, 0.05f); // 显示检测点
    }
}