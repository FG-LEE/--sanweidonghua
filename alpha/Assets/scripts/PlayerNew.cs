using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerNew : MonoBehaviour
{
    // �������
    public Rigidbody rb;                    // ������������������˶�
    [SerializeField] private Animator anime; // ���������������ڽ�ɫ����
    [SerializeField] private Transform characterModel; // ��ɫģ������
    private bool isMoving;                  // �Ƿ������ƶ��ı�־

    // ========== �ƶ���ر��� ==========
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 8f;        // �����ƶ��ٶ�
    private float xInput;                   // ˮƽ����ֵ (-1, 0, 1)
    private int faceDir = 1;                // ������ (1:��, -1:��)
    private bool faceRight = true;          // �Ƿ������Ҳ�
    private bool isPlayingFootstep = false; // �Ƿ����ڲ��ŽŲ���

    // ========== ��Ծ��ر��� ==========
    [Header("Jump Settings")]
    [SerializeField] private float jumpForce = 13f;       // ��Ծ����
    [SerializeField] private float maxJumpHeight = 4f;    // �����Ծ�߶�
    [SerializeField] private int maxJumpCount = 2;        // �����Ծ��������������
    [SerializeField] private float jumpBufferTime = 0.15f; // ��Ծ����ʱ�䣨��ǰ������Чʱ�䣩
    [SerializeField] private float coyoteTime = 0.1f;     // ����ʱ�䣨�뿪ƽ̨���Կ���Ծ��ʱ�䣩

    // ��Ծ״̬����
    private int currentJumpCount = 0;       // ��ǰ��Ծ����
    private float jumpBufferCounter;        // ��Ծ�����ʱ��
    private float coyoteTimeCounter;        // ����ʱ���ʱ��
    private bool isJumping = false;         // �Ƿ�������Ծ
    private float[] jumpStartY;             // ÿ����Ծ����ʼY����
    private bool[] jumpHeightReached;       // ÿ����Ծ�Ƿ��Ѵﵽ���߶�

    // ========== ������������ر��� ==========
    [Header("Gravity & Fall Settings")]
    [SerializeField] private float riseGravityScale = 1f;      // �����׶�����ϵ��
    [SerializeField] private float fallGravityScale = 2.2f;    // ����׶�����ϵ��
    [SerializeField] private float fastFallGravityScale = 3.5f; // ������������ϵ��
    [SerializeField] private float maxFallSpeed = -25f;        // ��������ٶ�����
    private bool isFastFalling = false;     // �Ƿ����ڿ�������

    // ========== �����ر��� ==========
    [Header("Dash Settings")]
    [SerializeField] private float dashDuration = 0.2f;   // ��̳���ʱ��
    [SerializeField] private float dashSpeed = 2f;        // ����ٶȱ���
    private float dashTime;                // ���ʣ��ʱ��
    private bool isDashing = false;        // �Ƿ����ڳ��

    // ========== ��ײ�����ر��� ==========
    [Header("Collision Detection")]
    [SerializeField] private LayerMask whatIsGround;          // ����㼶����
    [SerializeField] private float groundCheckDistance = 0.1f; // ���������
    [SerializeField] private Vector3 groundCheckOffset = Vector3.zero; // ������ƫ��
    private bool isGround;                 // �Ƿ��ڵ�����

    // ========== ǽ�ڻ�����ر��� ==========
    [Header("Wall Slide Settings")]
    [SerializeField] private LayerMask whatIsWall;            // ǽ�ڲ㼶����
    [SerializeField] private float wallCheckDistance = 0.5f;  // ǽ�ڼ�����
    [SerializeField] private Vector3 wallCheckOffset = new Vector3(0, 1.6f, 0); // ǽ�ڼ��ƫ��
    [SerializeField] private float wallSlideSpeed = 2f;       // ǽ�ڻ����ٶ�
    [SerializeField] private float wallJumpForce = 10f;       // ǽ����Ծ����
    [SerializeField] private Vector2 wallJumpDirection = new Vector2(1f, 1.5f); // ǽ����Ծ����
    private bool isTouchingWall;           // �Ƿ�Ӵ�ǽ��
    private bool isWallSliding;            // �Ƿ�����ǽ�ڻ���
    private bool isTouchingRightWall;      // �Ƿ�Ӵ��Ҳ�ǽ��
    private bool isTouchingLeftWall;       // �Ƿ�Ӵ����ǽ��
    private bool wallSlideInput;           // ǽ�ڻ��������־

    // ========== �������ڷ��� ==========

    /// <summary>
    /// ��ʼ������������Ϸ��ʼʱ����һ��
    /// </summary>
    void Start()
    {
        // ��ȡ�������
        rb = GetComponent<Rigidbody>();

        // ��ȡ��ɫģ�����ã������壩
        if (characterModel == null)
        {
            // ���û��ָ�������Դ��������в���
            if (transform.childCount > 0)
            {
                characterModel = transform.GetChild(0);
            }
            else
            {
                Debug.LogError("Character Model not assigned and no child objects found!");
            }
        }

        // �ӽ�ɫģ���л�ȡ�������
        if (characterModel != null)
        {
            anime = characterModel.GetComponent<Animator>();
            if (anime == null)
            {
                Debug.LogWarning("Animator component not found on character model!");
            }
        }

        // ��ʼ����Ծ�������
        jumpStartY = new float[maxJumpCount];
        jumpHeightReached = new bool[maxJumpCount];
        for (int i = 0; i < maxJumpCount; i++)
        {
            jumpHeightReached[i] = false;
        }

        // ��ʼ����������
        rb.useGravity = false; // ����Ĭ��������ʹ���Զ�������ϵͳ
    }

    /// <summary>
    /// ÿ֡���£����ڴ�������ͷ�������ص��߼�
    /// </summary>
    void Update()
    {
        GetInput();             // ��ȡ�������
        HandleTimers();         // ���¸��ּ�ʱ��
        HandleJumpInput();      // ������Ծ����
        HandleDashInput();      // �����������
        UpdateAnimations();     // ���¶���״̬
    }

    /// <summary>
    /// �̶�ʱ�䲽�����£�����������صļ���
    /// ��֤����������ȶ��ԣ�����֡��Ӱ��
    /// </summary>
    void FixedUpdate()
    {
        GroundCheck();          // ������ײ���
        WallCheck();            // ǽ����ײ���
        HandleMovement();       // �����ƶ��߼�
        HandleJump();           // ������Ծ�߼�
        HandleWallSlide();      // ����ǽ�ڻ����߼�
        HandleGravity();        // Ӧ���Զ�������
        HandleFallSpeed();      // ���������ٶ�
        FlipController();       // ���ƽ�ɫ��ת
        CheckJumpHeight();      // ���ÿ����Ծ�߶�����
    }

    // ========== ���봦�����ʱ������ ==========

    /// <summary>
    /// ��ȡ�������
    /// </summary>
    private void GetInput()
    {
        // ��ȡˮƽ���룬����ֵ�� -1���󣩵� 1���ң�֮��
        float previousInput = xInput;
        xInput = Input.GetAxisRaw("Horizontal");
        bool wasMoving = Mathf.Abs(previousInput) > 0.1f;
        bool isMovingNow = Mathf.Abs(xInput) > 0.1f;

        // ����Ƿ��ڵ�����
        bool canPlayFootstep = isGround && !isWallSliding;

        // ��ʼ�ƶ����ڵ�����ʱ������Ч
        if (!wasMoving && isMovingNow && canPlayFootstep)
        {
            AudioManager.instance.PlaySFX(0);
            isPlayingFootstep = true;
        }
        // �����ƶ����ڵ�����ʱ�����֮ǰû�ڲ��ţ���ʼ����
        else if (isMovingNow && canPlayFootstep && !isPlayingFootstep)
        {
            AudioManager.instance.PlaySFX(0);
            isPlayingFootstep = true;
        }
        // ֹͣ�ƶ�ʱֹͣ��Ч
        else if (wasMoving && !isMovingNow && isPlayingFootstep)
        {
            AudioManager.instance.StopSFX(0);
            isPlayingFootstep = false;
        }
        // �뿪����ʱֹͣ��Ч
        else if (!canPlayFootstep && isPlayingFootstep)
        {
            AudioManager.instance.StopSFX(0);
            isPlayingFootstep = false;
        }

        // ���ǽ�ڻ������루���·��������ǽ�ڣ�
        bool rightWallInput = (xInput > 0);
        bool leftWallInput = (xInput < 0);

        wallSlideInput = (isTouchingRightWall && rightWallInput) ||
                         (isTouchingLeftWall && leftWallInput);
    }

    /// <summary>
    /// �������ּ�ʱ���ĸ���
    /// </summary>
    private void HandleTimers()
    {
        // ��Ծ�����ʱ����������������ǰ��ǰ������Ծ��
        jumpBufferCounter -= Time.deltaTime;

        // ����ʱ���ʱ��������������뿪ƽ̨���ʱ�����Կ���Ծ
        if (isGround)
        {
            coyoteTimeCounter = coyoteTime; // �ڵ�����ʱ��������ʱ��
        }
        else
        {
            coyoteTimeCounter -= Time.deltaTime; // �ڿ���ʱ�ݼ���ʱ��
        }

        // ��̼�ʱ��
        dashTime -= Time.deltaTime;
    }

    /// <summary>
    /// ������Ծ��ص�������
    /// </summary>
    private void HandleJumpInput()
    {
        // �����Ծ�����£�������Ծ����
        if (Input.GetKeyDown(KeyCode.Space))
        {
            // ǽ����Ծ���
            if (isWallSliding)
            {
                ExecuteWallJump();
            }
            else
            {
                jumpBufferCounter = jumpBufferTime;
            }
        }

        // �������������루����S�����·������
        isFastFalling = (Input.GetKey(KeyCode.S) || Input.GetKey(KeyCode.DownArrow)) &&
                        !isGround && rb.velocity.y < 0;
    }

    /// <summary>
    /// �����������
    /// </summary>
    private void HandleDashInput()
    {
        if (Input.GetKeyDown(KeyCode.LeftShift) && !isDashing)
        {
            StartDash();
        }

        // ���³�̼�ʱ��
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
    /// ��ʼ���
    /// </summary>
    private void StartDash()
    {
        isDashing = true;
        dashTime = dashDuration;
        Debug.Log($"���ö���������isDashing={anime.GetBool("isDashing")}");
        // ���ų����Ч
        if (VfxManager.instance != null)
        {
            VfxManager.instance.PlayVFX(0, this.transform.position);
        }

        // ���ų����Ч����ѡ��
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(3); // ����3�ǳ����Ч������
        }
        
    }
    /// <summary>
    /// �������
    /// </summary>
    private void EndDash()
    {
        isDashing = false;
        Debug.Log($"���ö���������isDashing={anime.GetBool("isDashing")}");
    }



    // ========== �ƶ�����ϵͳ ==========

    /// <summary>
    /// ������ɫ�ƶ��߼� - �򻯰汾
    /// </summary>
    private void HandleMovement()
    {
        // ǽ�ڻ���ʱ����ˮƽ�ƶ�
        if (isWallSliding)
        {
            // ǽ�ڻ���ʱ����ˮƽ�ٶ�Ϊ�㣬ֻ������ֱ����
            rb.velocity = new Vector3(0, rb.velocity.y, rb.velocity.z);
            return;
        }

        // ����߼����ڳ��ʱ����Ӧ�ó���ٶ�
        if (isDashing)
        {
            // ���ʱ���������ƶ����ٶ�Ϊ�����ٶȳ��Գ�̱���
            float dashTargetSpeed = faceDir * moveSpeed * dashSpeed;
            rb.velocity = new Vector3(dashTargetSpeed, rb.velocity.y, rb.velocity.z);
        }
        else
        {
            // �����ƶ�
            float targetSpeed = xInput * moveSpeed;
            rb.velocity = new Vector3(targetSpeed, rb.velocity.y, rb.velocity.z);
        }
    }

    /// <summary>
    /// ���ƽ�ɫ����
    /// �����ƶ������Զ���ת��ɫ sprite
    /// </summary>
    private void FlipController()
    {
        // ǽ�ڻ���ʱ��������ת
        if (isWallSliding) return;

        // �����ƶ��ҵ�ǰ������ʱ��ת
        if (xInput > 0.1f && !faceRight)
        {
            Flip();
        }
        // �����ƶ��ҵ�ǰ������ʱ��ת
        else if (xInput < -0.1f && faceRight)
        {
            Flip();
        }
    }

    /// <summary>
    /// ִ�н�ɫ��ת��ֻ��ת�����壩
    /// </summary>
    private void Flip()
    {
        faceDir *= -1;          // ��ת������
        faceRight = !faceRight; // ��������״̬

        // ֻ��ת��ɫģ�ͣ�����ת������
        if (characterModel != null)
        {
            // ͨ����תʵ���Ӿ��ϵķ�ת
            characterModel.Rotate(0, 180, 0);
        }
    }

    // ========== ��Ծ����ϵͳ ==========

    /// <summary>
    /// ������Ծ�߼���������Ծ���������ʱ��
    /// </summary>
    private void HandleJump()
    {
        if (isDashing) return;
        // ������Ծ״̬������ɫ�ڵ����������������ֹʱ
        if (isGround && rb.velocity.y <= 0)
        {
            currentJumpCount = 0;    // ������Ծ����
            isJumping = false;       // ���Ϊ����Ծ״̬

            // ����������Ծ�߶�����״̬
            for (int i = 0; i < maxJumpCount; i++)
            {
                jumpHeightReached[i] = false;
            }
        }

        // ִ����Ծ������飺��Ծ������Ч�ҿ�����Ծ��ǽ�ڻ���ʱ��������ͨ��Ծ��
        if (jumpBufferCounter > 0 && CanJump() && !isWallSliding)
        {
            ExecuteJump(); // ִ����Ծ
        }

        // С�����ƣ��ɿ���Ծ��ʱ���������ٶ�
        if (isJumping && rb.velocity.y > 0 && !Input.GetKey(KeyCode.Space))
        {
            // ��������Y���ٶȣ�ʵ��С��Ч��
            rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y * 0.5f, rb.velocity.z);
        }
    }

    /// <summary>
    /// ����Ƿ���Խ�����Ծ
    /// ����������ʱ��Ͷ����
    /// </summary>
    /// <returns>�Ƿ������Ծ</returns>
    private bool CanJump()
    {
        // ��һ�����������ڵ����ϻ�����ʱ���ڣ�����δ��ʼ��Ծ
        bool canFirstJump = (isGround || coyoteTimeCounter > 0) && currentJumpCount == 0;

        // ������������ڿ�������Ծ����δ������
        bool canMultiJump = !isGround && currentJumpCount < maxJumpCount;

        return canFirstJump || canMultiJump;
    }

    /// <summary>
    /// ִ����Ծ����
    /// </summary>
    private void ExecuteJump()
    {
        // ��¼��ǰ��Ծ�ε���ʼλ��
        jumpStartY[currentJumpCount] = transform.position.y;
        jumpHeightReached[currentJumpCount] = false;

        // ���ô�ֱ�ٶȣ�ȷ��ÿ����Ծ�߶�һ��
        rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);

        // Ӧ����Ծ�ٶ�
        rb.velocity = new Vector3(rb.velocity.x, jumpForce, rb.velocity.z);

        // ������Ծ״̬
        currentJumpCount++;          // ������Ծ����
        jumpBufferCounter = 0;       // �����Ծ����
        coyoteTimeCounter = 0;       // �������ʱ��
        isJumping = true;            // ���Ϊ��Ծ״̬
        isFastFalling = false;       // ���ÿ�������״̬

        // ������Ծ��Ч
       
    }

    /// <summary>
    /// ִ��ǽ����Ծ
    /// </summary>
    private void ExecuteWallJump()
    {
        // ȷ��ǽ����Ծ�ķ���
        int jumpDirection;


        // ����Ƿ���ˮƽ����
        if (Mathf.Abs(xInput) > 0.1f)
        {
            // �����룺�������뷽����Ծ
            jumpDirection = xInput > 0 ? 1 : -1;
        }
        else
        {
            // û�����룺���ֵ�ǰ����
            jumpDirection = faceDir;
        }

        

        // ����ǽ����Ծ�ٶ�
        Vector2 jumpVelocity = new Vector2(wallJumpDirection.x * jumpDirection, wallJumpDirection.y);
        jumpVelocity.Normalize(); // ��׼������
        jumpVelocity *= wallJumpForce;

        // Ӧ��ǽ����Ծ�ٶ�
        rb.velocity = new Vector3(jumpVelocity.x, jumpVelocity.y, rb.velocity.z);

        // ���½�ɫ����
        if (jumpDirection != faceDir)
        {
            Flip();
        }

        // ����״̬
        isWallSliding = false;
        isJumping = true;
        currentJumpCount = 1; // ǽ����Ծ������һ����Ծ

        // ������Ծ��Ч
        if (AudioManager.instance != null)
        {
            AudioManager.instance.PlaySFX(1);
        }
    }

    /// <summary>
    /// ���ÿ����Ծ�ĸ߶�����
    /// </summary>
    private void CheckJumpHeight()
    {
        if (!isJumping || currentJumpCount == 0) return;

        // ��鵱ǰ��Ծ�εĸ߶�����
        int currentJumpIndex = currentJumpCount - 1;

        if (!jumpHeightReached[currentJumpIndex] &&
            transform.position.y - jumpStartY[currentJumpIndex] >= maxJumpHeight &&
            rb.velocity.y > 0)
        {
            // ��ǰ��Ծ���Ѵﵽ���߶ȣ����������ٶ�
            rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);
            jumpHeightReached[currentJumpIndex] = true;
        }
    }

    // ========== ǽ�ڻ��п���ϵͳ ==========

    /// <summary>
    /// ǽ�ڼ�⣬ʹ��3D���߼���ж��Ƿ�Ӵ�ǽ��
    /// </summary>
    private void WallCheck()
    {
        // ����ǽ�ڼ��λ�ã�������λ�� + ƫ������
        Vector3 wallDetectionPoint = transform.position + wallCheckOffset;

        // 3D���߼���Ҳ�ǽ�ڣ��Ӽ���λ�ü�⣩
        RaycastHit rightHit;
        isTouchingRightWall = Physics.Raycast(wallDetectionPoint, Vector3.right, out rightHit, wallCheckDistance, whatIsWall) && faceRight;

        // 3D���߼�����ǽ�ڣ��Ӽ���λ�ü�⣩
        RaycastHit leftHit;
        isTouchingLeftWall = Physics.Raycast(wallDetectionPoint, Vector3.left, out leftHit, wallCheckDistance, whatIsWall) && !faceRight;

        // ����ǽ�ڽӴ�״̬
        isTouchingWall = isTouchingRightWall || isTouchingLeftWall;

        // ����Ƿ�Ӧ�ÿ�ʼǽ�ڻ��У����´���ģʽ��
        if (!isGround && isTouchingWall && !isWallSliding && wallSlideInput)
        {
            isWallSliding = true;
        }

        // ����Ƿ�Ӧ�ý���ǽ�ڻ��У���ػ��뿪ǽ��ʱ�Զ�������
        if (isWallSliding)
        {
            bool shouldStopWallSlide = isGround || !isTouchingWall;

            if (shouldStopWallSlide)
            {
                isWallSliding = false;
            }
        }

        // ����ǽ�ڻ��������־��ȷ��ֻ����һ�Σ�
        wallSlideInput = false;
    }

    /// <summary>
    /// ����ǽ�ڻ����߼�
    /// </summary>
    private void HandleWallSlide()
    {
        if (isWallSliding)
        {
            // ���������ٶ�Ϊǽ�ڻ����ٶ�
            if (rb.velocity.y < -wallSlideSpeed)
            {
                rb.velocity = new Vector3(rb.velocity.x, -wallSlideSpeed, rb.velocity.z);
            }
        }
    }

    // ========== �������������ϵͳ ==========

    /// <summary>
    /// ��������Ӧ�ã�ʵ���Զ�������ϵͳ
    /// </summary>
    private void HandleGravity()
    {
        // ǽ�ڻ���ʱʹ�ý�С������
        if (isWallSliding)
        {
            // ǽ�ڻ���ʱʹ�ý�С������ϵ��
            float wallSlideGravityScale = 0.5f;
            Vector3 wallSlideGravity = Physics.gravity * wallSlideGravityScale;
            rb.velocity += wallSlideGravity * Time.fixedDeltaTime;
            return;
        }

        // ��ȡ��ǰ����ϵ��
        float gravityScale = GetCurrentGravityScale();

        // ��������������Ӧ��
        Vector3 normalGravity = Physics.gravity * gravityScale;
        rb.velocity += normalGravity * Time.fixedDeltaTime;
    }

    /// <summary>
    /// ���ݽ�ɫ״̬��ȡ��ǰ����ϵ��
    /// </summary>
    /// <returns>��ǰ����ϵ��</returns>
    private float GetCurrentGravityScale()
    {
        if (isFastFalling) // ��������״̬
        {
            return fastFallGravityScale;
        }
        else if (rb.velocity.y < 0) // ��ͨ����״̬
        {
            return fallGravityScale;
        }
        else // ����״̬
        {
            return riseGravityScale;
        }
    }

    /// <summary>
    /// ���������ٶ�����
    /// </summary>
    private void HandleFallSpeed()
    {
        // ǽ�ڻ���ʱ�Ѿ����ٶ����ƣ�������������ٶȼ��
        if (isWallSliding) return;

        // ��������ٶȳ���������ƣ�ֱ������Ϊ��������ٶ�
        if (rb.velocity.y < maxFallSpeed)
        {
            rb.velocity = new Vector3(rb.velocity.x, maxFallSpeed, rb.velocity.z);
        }
    }

    // ========== ��ײ����붯��ϵͳ ==========

    /// <summary>
    /// �����⣬ʹ��3D���߼���ж��Ƿ��ڵ�����
    /// </summary>
    private void GroundCheck()
    {
        bool wasGround = isGround; // ��¼֮ǰ�ĵ���״̬

        // ���������λ�ã�������λ�� + ƫ������
        Vector3 groundDetectionPoint = transform.position + groundCheckOffset;

        // �Ӽ���λ�����·���3D���߼�����
        RaycastHit hit;
        isGround = Physics.Raycast(groundDetectionPoint, Vector3.down, out hit, groundCheckDistance, whatIsGround);

        // ��ؼ�⣺�ӿ����䵽����ʱ����
        if (!wasGround && isGround && rb.velocity.y <= 0)
        {
            OnLand(); // ������ش���
        }
    }

    /// <summary>
    /// ���ʱ�Ĵ�������
    /// </summary>
    private void OnLand()
    {
        // ���������ٶȲ��Ų�ͬ�������Ч
        if (AudioManager.instance != null && rb.velocity.y < -5f)
        {
            AudioManager.instance.PlaySFX(2); // ����2�������Ч������
        }
    }

    /// <summary>
    /// ���¶���״̬�Ͳ���
    /// </summary>
    private void UpdateAnimations()
    {
        // �ж��Ƿ����ƶ����������������ʵ���ٶȣ�
        isMoving = Mathf.Abs(xInput) > 0.1f;

        // ֱ�����ö���������û��ƽ������
        if (anime != null)
        {
            anime.SetFloat("Speed", Mathf.Abs(xInput));  // �ƶ��ٶȣ�ֱ��ʹ������ֵ��
            anime.SetBool("isMoving", isMoving);         // �Ƿ����ƶ�
            anime.SetBool("isGround", isGround);         // �Ƿ��ڵ���
            anime.SetBool("isWallSliding", isWallSliding); // �Ƿ���ǽ�ڻ���
            anime.SetBool("isDashing", isDashing);       // �Ƿ��ڳ�̣�������
            anime.SetFloat("ySpeed", rb.velocity.y);
        }
    }

    // ========== ��������ӻ� ==========

    /// <summary>
    /// ��Scene��ͼ�л��Ƶ���ͼ��
    /// </summary>
    private void OnDrawGizmos()
    {
        // �������λ��
        Vector3 groundDetectionPoint = transform.position + groundCheckOffset;
        Vector3 wallDetectionPoint = transform.position + wallCheckOffset;

        // ���Ƶ�������
        Gizmos.color = isGround ? Color.green : Color.red;
        Gizmos.DrawLine(groundDetectionPoint, groundDetectionPoint + Vector3.down * groundCheckDistance);
        Gizmos.DrawSphere(groundDetectionPoint, 0.05f); // ��ʾ����

        // ����ǽ�ڼ����
        Gizmos.color = isTouchingWall ? Color.blue : Color.white;
        Gizmos.DrawLine(wallDetectionPoint, wallDetectionPoint + Vector3.right * wallCheckDistance);
        Gizmos.DrawLine(wallDetectionPoint, wallDetectionPoint + Vector3.left * wallCheckDistance);
        Gizmos.DrawSphere(wallDetectionPoint, 0.05f); // ��ʾ����
    }
}