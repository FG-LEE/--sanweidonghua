using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR;

public class Player1 : MonoBehaviour
{
    public Rigidbody rb;
    [SerializeField] private Animator anime;
    private bool isMoving;
    [Header("Movement info")]
    [SerializeField]private float moveSpeed;
    [SerializeField] private float jumpForce;
    [Header("Dash info")]
    [SerializeField] private float dashDuration;
    [SerializeField] private float dashTime;
    [SerializeField] private float dashSpeed;

    private float xInput;
    private int faceDir =1;
    private bool faceRight = true;

    [Header("Collision info")]
    [SerializeField] private LayerMask whatisGround;
    [SerializeField] private float groundCheckDistance;
    private bool isGround;
    // Start is called before the first frame update
    void Start()
    {
        rb= GetComponent<Rigidbody>();
        anime= GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        xInput = Input.GetAxisRaw("Horizontal");
        Movement();
        if (Input.GetKeyDown(KeyCode.Space))
        {
            Jump();
        }
        FlipController();
        GroundCheck();
        dashTime -= Time.deltaTime;
        if (Input.GetKeyDown(KeyCode.LeftShift)) 
        { 
            dashTime =dashDuration;
        }

        isMoving = rb.velocity.x != 0;
        anime.SetBool("isMoving", isMoving);
        anime.SetBool("isGround", isGround);
    }

    private void Movement()
    {
        if (dashTime > 0)
        {
            rb.velocity = new Vector3(faceDir*moveSpeed* dashSpeed, rb.velocity.y, 0);
        }
        else
        {
            rb.velocity = new Vector3(xInput * moveSpeed, rb.velocity.y, rb.velocity.z);
        }
    }

    private void Jump()
    {
        if (isGround)
        {
            rb.velocity = new Vector3(rb.velocity.x, jumpForce, rb.velocity.z);
        }
    }

    private void GroundCheck()
    {
        isGround = Physics.Raycast(transform.position, Vector3.down, groundCheckDistance, whatisGround);
    }

    void Flip()
    {
        faceDir = faceDir * -1;
        faceRight =!faceRight;
        transform.Rotate(0, 180, 0);
    }
    void FlipController()
    {
        if (rb.velocity.x > 0 && !faceRight)
        {
            Flip();
        }
        else if(rb.velocity.x < 0 && faceRight)
        {
            Flip();
        }
    }
    
    private void OnDrawGizmos()
    {
        Gizmos.DrawLine(transform.position, new Vector3(transform.position.x, transform.position.y-groundCheckDistance, transform.position.z));
    }
}