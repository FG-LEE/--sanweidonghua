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
    private float xInput;                   // 水平输入值 (-1, 0, 1)
    private int faceDir = 1;                // 面向方向 (1:右, -1:左)
    private bool faceRight = true;          // 是否面向右侧

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
        HandleMovement();       // 处理移动逻辑
        HandleJump();           // 处理跳跃逻辑
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
        xInput = Input.GetAxisRaw("Horizontal");
        if(Mathf.Abs(xInput)>0)
            AudioManager.instance.PlaySFX(0);
        
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
            VfxManager.instance.PlayVFX(0, this.transform.position);
        }
    }

    // ========== 移动控制系统 ==========

    /// <summary>
    /// 处理角色移动逻辑 - 简化版本
    /// </summary>
    private void HandleMovement()
    {
        // 直接计算水平速度，没有平滑过渡
        float targetSpeed = xInput * moveSpeed;

        // 冲刺逻辑：在冲刺时间内应用冲刺速度
        if (dashTime > 0)
        {
            // 冲刺时朝面向方向移动，速度为基础速度乘以冲刺倍数
            targetSpeed = faceDir * moveSpeed * dashSpeed;
        }

        // 直接应用速度到刚体，只修改X轴速度
        rb.velocity = new Vector3(targetSpeed, rb.velocity.y, rb.velocity.z);
    }


    /// <summary>
    /// 控制角色朝向
    /// 根据移动方向自动翻转角色 sprite
    /// </summary>
    private void FlipController()
    {
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

            // 重置所有跳跃高度限制状态
            for (int i = 0; i < maxJumpCount; i++)
            {
                jumpHeightReached[i] = false;
            }
        }

        // 执行跳跃条件检查：跳跃缓冲有效且可以跳跃
        if (jumpBufferCounter > 0 && CanJump())
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
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(1); // 假设1是跳跃音效的索引
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

    // ========== 重力与下落控制系统 ==========

    /// <summary>
    /// 处理重力应用，实现自定义重力系统
    /// </summary>
    private void HandleGravity()
    {
        // 获取当前重力系数
        float gravityScale = GetCurrentGravityScale();

        // 计算重力向量并应用
        Vector3 gravity = Physics.gravity * gravityScale;
        rb.velocity += gravity * Time.fixedDeltaTime;
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
        // 如果下落速度超过最大限制，直接设置为最大下落速度
        if (rb.velocity.y < maxFallSpeed)
        {
            rb.velocity = new Vector3(rb.velocity.x, maxFallSpeed, rb.velocity.z);
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
    /// </summary>
    private void UpdateAnimations()
    {
        // 判断是否在移动（基于输入而不是实际速度）
        isMoving = Mathf.Abs(xInput) > 0.1f;

        // 直接设置动画参数，没有平滑过渡
        anime.SetFloat("Speed", Mathf.Abs(xInput));  // 移动速度（直接使用输入值）
        anime.SetBool("isMoving", isMoving);         // 是否在移动
        anime.SetBool("isGround", isGround);         // 是否在地面
    }

    // ========== 调试与可视化 ==========

    /// <summary>
    /// 在Scene视图中绘制调试图形
    /// </summary>
    private void OnDrawGizmos()
    {
        // 绘制地面检测线
        Gizmos.color = isGround ? Color.green : Color.red;
        Gizmos.DrawLine(transform.position, transform.position + Vector3.down * groundCheckDistance);
    }
}