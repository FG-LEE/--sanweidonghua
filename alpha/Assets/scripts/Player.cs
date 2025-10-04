using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    [SerializeField] private float gravity;
    [SerializeField] private float speed;
    private CharacterController characterController;
    private Vector3 verticalMovement;
    private Vector3 horizontalMovement;
    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
    }
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (characterController.isGrounded)
        {
            verticalMovement.y = 0f;
        }
        else
        {
            verticalMovement.y += gravity*Time.deltaTime;
        }

        horizontalMovement = transform.forward * speed;
        characterController.Move(horizontalMovement*Time.deltaTime);
        characterController.Move(verticalMovement*Time.deltaTime);
    }
}
