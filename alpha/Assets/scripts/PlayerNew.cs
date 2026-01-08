using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerNew : MonoBehaviour
{
    // 基本组件
    public Rigidbody rb;                    // 刚体组件
    [SerializeField] private Animator anime; // 动画控制器
    [SerializeField] private Transform characterModel; // 角色模型变换
    private bool isMoving;                  // 是否正在移动

    // ========== 移动设置 ==========
    [Header("移动设置")]
    [SerializeField] private float moveSpeed = 8f;        // 移动速度
    private float xInput;                   // 水平输入值 (-1, 0, 1)
    private int faceDir = 1;                // 面向方向 (1:右, -1:左)
    private bool faceRight = true;          // 是否面向右侧
    private bool isPlayingFootstep = false; // 是否正在播放脚步声

    // ========== 跳跃设置 ==========
    [Header("跳跃设置")]
    [SerializeField] private float jumpForce = 13f;       // 跳跃力度
    [SerializeField] private float maxJumpHeight = 4f;    // 最大跳跃高度
    [SerializeField] private int maxJumpCount = 2;        // 最大跳跃次数
    [SerializeField] private float jumpBufferTime = 0.15f; // 跳跃缓冲时间
    [SerializeField] private float coyoteTime = 0.1f;     // 土狼时间

    // 跳跃状态变量
    private int currentJumpCount = 0;       // 当前跳跃次数
    private float jumpBufferCounter;        // 跳跃缓冲计时器
    private float coyoteTimeCounter;        // 土狼时间计时器
    private bool isJumping = false;         // 是否正在跳跃
    private float[] jumpStartY;             // 每次跳跃的起始Y位置
    private bool[] jumpHeightReached;       // 每次跳跃是否达到最大高度

    // ========== 重力与下落设置 ==========
    [Header("重力与下落设置")]
    [SerializeField] private float riseGravityScale = 1f;      // 上升时重力缩放
    [SerializeField] private float fallGravityScale = 2.2f;    // 下落时重力缩放
    [SerializeField] private float fastFallGravityScale = 3.5f; // 快速下落重力缩放
    [SerializeField] private float maxFallSpeed = -25f;        // 最大下落速度
    private bool isFastFalling = false;     // 是否正在快速下落

    // ========== 冲刺设置 ==========
    [Header("冲刺设置")]
    [SerializeField] private float dashDuration = 0.2f;   // 冲刺持续时间
    [SerializeField] private float dashSpeed = 2f;        // 冲刺速度倍率
    private float dashTime;                // 冲刺剩余时间
    private bool isDashing = false;        // 是否正在冲刺

    // ========== 碰撞检测设置 ==========
    [Header("碰撞检测设置")]
    [SerializeField] private LayerMask whatIsGround;          // 地面层级
    [SerializeField] private float groundCheckDistance = 0.1f; // 地面检测距离
    [SerializeField] private Vector3 groundCheckOffset = Vector3.zero; // 地面检测偏移
    private bool isGround;                 // 是否在地面上

    // ========== 爬墙设置 ==========
    [Header("爬墙设置")]
    [SerializeField] private LayerMask whatIsWall;            // 墙壁层级
    [SerializeField] private float wallCheckDistance = 0.5f;  // 墙壁检测距离
    [SerializeField] private Vector3 wallCheckOffset = new Vector3(0, 1.6f, 0); // 墙壁检测偏移
    [SerializeField] private float wallSlideSpeed = 2f;       // 爬墙下滑速度
    [SerializeField] private float wallJumpForce = 10f;       // 蹬墙跳力度
    [SerializeField] private Vector2 wallJumpDirection = new Vector2(1f, 1.5f); // 蹬墙跳方向
    private bool isTouchingWall;           // 是否接触墙壁
    private bool isWallSliding;            // 是否正在爬墙下滑
    private bool isTouchingRightWall;      // 是否接触右侧墙壁
    private bool isTouchingLeftWall;       // 是否接触左侧墙壁
    private bool wallSlideInput;           // 爬墙输入

    // ========== Unity事件函数 ==========

    /// <summary>
    /// 初始化函数，在游戏开始时调用一次
    /// </summary>
    void Start()
    {
        // 获取组件
        rb = GetComponent<Rigidbody>();

        // 如果角色模型未指定，尝试自动查找
        if (characterModel == null)
        {
            // 如果有子物体，使用第一个子物体作为角色模型
            if (transform.childCount > 0)
            {
                characterModel = transform.GetChild(0);
            }
            else
            {
                Debug.LogError("未指定角色模型且未找到子物体！");
            }
        }

        // 从角色模型获取动画组件
        if (characterModel != null)
        {
            anime = characterModel.GetComponent<Animator>();
            if (anime == null)
            {
                Debug.LogWarning("在角色模型上未找到动画组件！");
            }
        }

        // 初始化跳跃相关数组
        jumpStartY = new float[maxJumpCount];
        jumpHeightReached = new bool[maxJumpCount];
        for (int i = 0; i < maxJumpCount; i++)
        {
            jumpHeightReached[i] = false;
        }

        // 关闭Unity物理重力，使用自定义重力
        rb.useGravity = false;
    }

    /// <summary>
    /// 每帧调用的更新函数，处理输入和状态
    /// </summary>
    void Update()
    {
        GetInput();             // 获取输入
        HandleTimers();         // 处理计时器
        HandleJumpInput();      // 处理跳跃输入
        HandleDashInput();      // 处理冲刺输入
        UpdateAnimations();     // 更新动画状态
    }

    /// <summary>
    /// 固定时间间隔调用的物理更新函数
    /// 用于物理计算和移动控制
    /// </summary>
    void FixedUpdate()
    {
        GroundCheck();          // 地面检测
        WallCheck();            // 墙壁检测
        HandleMovement();       // 处理移动
        HandleJump();           // 处理跳跃
        HandleWallSlide();      // 处理爬墙下滑
        HandleGravity();        // 处理重力
        HandleFallSpeed();      // 处理下落速度
        FlipController();       // 控制角色翻转
        CheckJumpHeight();      // 检查跳跃高度
    }

    // ========== 输入处理 ==========

    /// <summary>
    /// 获取玩家输入
    /// </summary>
    private void GetInput()
    {
        // 获取水平输入值
        float previousInput = xInput;
        xInput = Input.GetAxisRaw("Horizontal");
        bool wasMoving = Mathf.Abs(previousInput) > 0.1f;
        bool isMovingNow = Mathf.Abs(xInput) > 0.1f;

        // 判断是否可以播放脚步声
        bool canPlayFootstep = isGround && !isWallSliding;

        // 开始移动时播放脚步声
        if (!wasMoving && isMovingNow && canPlayFootstep)
        {
            AudioManager.instance.PlaySFX(0);
            isPlayingFootstep = true;
        }
        // 持续移动时播放脚步声
        else if (isMovingNow && canPlayFootstep && !isPlayingFootstep)
        {
            AudioManager.instance.PlaySFX(0);
            isPlayingFootstep = true;
        }
        // 停止移动时停止脚步声
        else if (wasMoving && !isMovingNow && isPlayingFootstep)
        {
            AudioManager.instance.StopSFX(0);
            isPlayingFootstep = false;
        }
        // 条件不满足时停止脚步声
        else if (!canPlayFootstep && isPlayingFootstep)
        {
            AudioManager.instance.StopSFX(0);
            isPlayingFootstep = false;
        }

        // 检测爬墙输入
        bool rightWallInput = (xInput > 0);
        bool leftWallInput = (xInput < 0);

        wallSlideInput = (isTouchingRightWall && rightWallInput) ||
                         (isTouchingLeftWall && leftWallInput);
    }

    /// <summary>
    /// 处理各种计时器的更新
    /// </summary>
    private void HandleTimers()
    {
        // 减少跳跃缓冲计时器
        jumpBufferCounter -= Time.deltaTime;

        // 更新土狼时间计时器
        if (isGround)
        {
            coyoteTimeCounter = coyoteTime;
        }
        else
        {
            coyoteTimeCounter -= Time.deltaTime;
        }

        // 减少冲刺时间
        dashTime -= Time.deltaTime;
    }

    /// <summary>
    /// 处理跳跃输入
    /// </summary>
    private void HandleJumpInput()
    {
        // 按下空格键时
        if (Input.GetKeyDown(KeyCode.Space))
        {
            // 爬墙时执行蹬墙跳
            if (isWallSliding)
            {
                ExecuteWallJump();
            }
            else
            {
                jumpBufferCounter = jumpBufferTime;
            }
        }

        // 检测快速下落输入
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

        // 更新冲刺时间
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

        // 播放特效
        if (VfxManager.instance != null)
        {
            VfxManager.instance.PlayVFX(0, this.transform.position);
        }

        // 播放音效
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(3);
        }
    }

    /// <summary>
    /// 结束冲刺
    /// </summary>
    private void EndDash()
    {
        isDashing = false;
    }

    // ========== 移动控制 ==========

    /// <summary>
    /// 处理角色移动
    /// </summary>
    private void HandleMovement()
    {
        // 爬墙时限制水平移动
        if (isWallSliding)
        {
            rb.velocity = new Vector3(0, rb.velocity.y, rb.velocity.z);
            return;
        }

        // 冲刺时的移动
        if (isDashing)
        {
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
    /// 控制角色翻转
    /// 根据移动方向翻转角色Sprite
    /// </summary>
    private void FlipController()
    {
        // 爬墙时不翻转
        if (isWallSliding) return;

        // 向右移动且面朝左时翻转
        if (xInput > 0.1f && !faceRight)
        {
            Flip();
        }
        // 向左移动且面朝右时翻转
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
        faceDir *= -1;
        faceRight = !faceRight;

        // 旋转角色模型
        if (characterModel != null)
        {
            characterModel.Rotate(0, 180, 0);
        }
    }

    // ========== 跳跃控制 ==========

    /// <summary>
    /// 处理跳跃逻辑
    /// 包括跳跃缓冲和土狼时间
    /// </summary>
    private void HandleJump()
    {
        if (isDashing) return;

        // 重置跳跃状态
        if (isGround && rb.velocity.y <= 0)
        {
            currentJumpCount = 0;
            isJumping = false;

            // 重置跳跃高度记录
            for (int i = 0; i < maxJumpCount; i++)
            {
                jumpHeightReached[i] = false;
            }
        }

        // 执行跳跃（如果有缓冲输入）
        if (jumpBufferCounter > 0 && CanJump() && !isWallSliding)
        {
            ExecuteJump();
        }

        // 短按跳跃时减少跳跃高度
        if (isJumping && rb.velocity.y > 0 && !Input.GetKey(KeyCode.Space))
        {
            rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y * 0.5f, rb.velocity.z);
        }
    }

    /// <summary>
    /// 检查是否可以跳跃
    /// 考虑土狼时间和多重跳跃
    /// </summary>
    /// <returns>是否可以跳跃</returns>
    private bool CanJump()
    {
        // 检查是否可以第一次跳跃
        bool canFirstJump = (isGround || coyoteTimeCounter > 0) && currentJumpCount == 0;

        // 检查是否可以多重跳跃
        bool canMultiJump = !isGround && currentJumpCount < maxJumpCount;

        return canFirstJump || canMultiJump;
    }

    /// <summary>
    /// 执行跳跃
    /// </summary>
    private void ExecuteJump()
    {
        // 记录跳跃起始高度
        jumpStartY[currentJumpCount] = transform.position.y;
        jumpHeightReached[currentJumpCount] = false;

        // 重置垂直速度以确保一致的跳跃高度
        rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);

        // 应用跳跃力
        rb.velocity = new Vector3(rb.velocity.x, jumpForce, rb.velocity.z);

        // 更新跳跃状态
        currentJumpCount++;
        jumpBufferCounter = 0;
        coyoteTimeCounter = 0;
        isJumping = true;
        isFastFalling = false;
    }

    /// <summary>
    /// 执行蹬墙跳
    /// </summary>
    private void ExecuteWallJump()
    {
        // 确定跳跃方向
        int jumpDirection;

        // 根据输入确定方向
        if (Mathf.Abs(xInput) > 0.1f)
        {
            jumpDirection = xInput > 0 ? 1 : -1;
        }
        else
        {
            jumpDirection = faceDir;
        }

        // 计算蹬墙跳速度
        Vector2 jumpVelocity = new Vector2(wallJumpDirection.x * jumpDirection, wallJumpDirection.y);
        jumpVelocity.Normalize();
        jumpVelocity *= wallJumpForce;

        // 应用速度
        rb.velocity = new Vector3(jumpVelocity.x, jumpVelocity.y, rb.velocity.z);

        // 如果需要，翻转角色
        if (jumpDirection != faceDir)
        {
            Flip();
        }

        // 更新状态
        isWallSliding = false;
        isJumping = true;
        currentJumpCount = 1;


    }

    /// <summary>
    /// 检查并限制跳跃高度
    /// </summary>
    private void CheckJumpHeight()
    {
        if (!isJumping || currentJumpCount == 0) return;

        // 获取当前跳跃的索引
        int currentJumpIndex = currentJumpCount - 1;

        if (!jumpHeightReached[currentJumpIndex] &&
            transform.position.y - jumpStartY[currentJumpIndex] >= maxJumpHeight &&
            rb.velocity.y > 0)
        {
            // 达到最大高度时停止上升
            rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);
            jumpHeightReached[currentJumpIndex] = true;
        }
    }

    // ========== 爬墙控制 ==========

    /// <summary>
    /// 墙壁检测
    /// 使用3D射线检测是否接触墙壁
    /// </summary>
    private void WallCheck()
    {
        // 计算墙壁检测点
        Vector3 wallDetectionPoint = transform.position + wallCheckOffset;

        // 检测右侧墙壁
        RaycastHit rightHit;
        isTouchingRightWall = Physics.Raycast(wallDetectionPoint, Vector3.right, out rightHit, wallCheckDistance, whatIsWall) && faceRight;

        // 检测左侧墙壁
        RaycastHit leftHit;
        isTouchingLeftWall = Physics.Raycast(wallDetectionPoint, Vector3.left, out leftHit, wallCheckDistance, whatIsWall) && !faceRight;

        // 更新接触墙壁状态
        isTouchingWall = isTouchingRightWall || isTouchingLeftWall;

        // 开始爬墙
        if (!isGround && isTouchingWall && !isWallSliding && wallSlideInput)
        {
            isWallSliding = true;
        }

        // 停止爬墙
        if (isWallSliding)
        {
            bool shouldStopWallSlide = isGround || !isTouchingWall;

            if (shouldStopWallSlide)
            {
                isWallSliding = false;
            }
        }

        // 重置爬墙输入
        wallSlideInput = false;
    }

    /// <summary>
    /// 处理爬墙下滑
    /// </summary>
    private void HandleWallSlide()
    {
        if (isWallSliding)
        {
            // 限制下滑速度
            if (rb.velocity.y < -wallSlideSpeed)
            {
                rb.velocity = new Vector3(rb.velocity.x, -wallSlideSpeed, rb.velocity.z);
            }
        }
    }

    // ========== 重力与物理控制 ==========

    /// <summary>
    /// 处理重力应用
    /// 替代Unity物理重力系统
    /// </summary>
    private void HandleGravity()
    {
        // 爬墙时的特殊重力处理
        if (isWallSliding)
        {
            float wallSlideGravityScale = 0.5f;
            Vector3 wallSlideGravity = Physics.gravity * wallSlideGravityScale;
            rb.velocity += wallSlideGravity * Time.fixedDeltaTime;
            return;
        }

        // 获取当前重力缩放
        float gravityScale = GetCurrentGravityScale();

        // 应用重力
        Vector3 normalGravity = Physics.gravity * gravityScale;
        rb.velocity += normalGravity * Time.fixedDeltaTime;
    }

    /// <summary>
    /// 根据当前状态获取重力缩放值
    /// </summary>
    /// <returns>当前重力缩放值</returns>
    private float GetCurrentGravityScale()
    {
        if (isFastFalling)
        {
            return fastFallGravityScale;
        }
        else if (rb.velocity.y < 0)
        {
            return fallGravityScale;
        }
        else
        {
            return riseGravityScale;
        }
    }

    /// <summary>
    /// 限制最大下落速度
    /// </summary>
    private void HandleFallSpeed()
    {
        // 爬墙时不限制下落速度
        if (isWallSliding) return;

        // 限制最大下落速度
        if (rb.velocity.y < maxFallSpeed)
        {
            rb.velocity = new Vector3(rb.velocity.x, maxFallSpeed, rb.velocity.z);
        }
    }

    // ========== 碰撞检测 ==========

    /// <summary>
    /// 地面检测
    /// 使用3D射线检测是否在地面上
    /// </summary>
    private void GroundCheck()
    {
        bool wasGround = isGround;

        // 计算地面检测点
        Vector3 groundDetectionPoint = transform.position + groundCheckOffset;

        // 执行射线检测
        RaycastHit hit;
        isGround = Physics.Raycast(groundDetectionPoint, Vector3.down, out hit, groundCheckDistance, whatIsGround);

        // 着陆时触发事件
        if (!wasGround && isGround && rb.velocity.y <= 0)
        {
            OnLand();
        }
    }

    /// <summary>
    /// 着陆时调用
    /// </summary>
    private void OnLand()
    {
        // 播放着陆音效
        if (AudioManager.instance != null && rb.velocity.y < -5f)
        {
            AudioManager.instance.PlaySFX(2);
        }
    }

    /// <summary>
    /// 更新动画状态
    /// </summary>
    private void UpdateAnimations()
    {
        // 计算是否正在移动
        isMoving = Mathf.Abs(xInput) > 0.1f;

        // 设置动画参数
        if (anime != null)
        {
            anime.SetFloat("Speed", Mathf.Abs(xInput));
            anime.SetBool("isMoving", isMoving);
            anime.SetBool("isGround", isGround);
            anime.SetBool("isWallSliding", isWallSliding);
            anime.SetBool("isDashing", isDashing);
            anime.SetFloat("ySpeed", rb.velocity.y);
        }
    }

    // ========== 调试辅助 ==========

    /// <summary>
    /// 在Scene视图中绘制调试信息
    /// </summary>
    private void OnDrawGizmos()
    {
        // 计算检测点
        Vector3 groundDetectionPoint = transform.position + groundCheckOffset;
        Vector3 wallDetectionPoint = transform.position + wallCheckOffset;

        // 绘制地面检测线
        Gizmos.color = isGround ? Color.green : Color.red;
        Gizmos.DrawLine(groundDetectionPoint, groundDetectionPoint + Vector3.down * groundCheckDistance);
        Gizmos.DrawSphere(groundDetectionPoint, 0.05f);

        // 绘制墙壁检测线
        Gizmos.color = isTouchingWall ? Color.blue : Color.white;
        Gizmos.DrawLine(wallDetectionPoint, wallDetectionPoint + Vector3.right * wallCheckDistance);
        Gizmos.DrawLine(wallDetectionPoint, wallDetectionPoint + Vector3.left * wallCheckDistance);
        Gizmos.DrawSphere(wallDetectionPoint, 0.05f);
    }
}