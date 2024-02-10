using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public float speed = 10f; // 속도 저장 변수
    private Rigidbody playerRigidbody; // rigidbody 컴포넌트 사용하기 위해 변수로서 선언하기
    public GameManager gameManager;

    // User this for initializaion
    void Start()
    {
        playerRigidbody = GetComponent<Rigidbody>();   
    }

    // Update is called once per frame
    void Update()
    {
        if(gameManager.isGameOver == true) {
            return;
            // 밑에 유저입력을 받을 수가 없음
        }

        // 유저입력
        // -1 ~ +1
        float inputX = Input.GetAxis("Horizontal"); 
        float inputZ = Input.GetAxis("Vertical");
        float fallSpeed = playerRigidbody.velocity.y;

        Vector3 velocity = new Vector3(inputX, 0, inputZ);
        velocity = velocity * speed;
        velocity.y = fallSpeed; // new Vector3(inputX * speed, fallSpeed * speed, inputZ * speed)
        playerRigidbody.velocity = velocity;
    }
}
