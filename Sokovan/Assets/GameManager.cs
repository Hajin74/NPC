using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    // 모든 itembox 변수들을 가져와야 함
    public ItemBox[] itemBoxes;
    public bool isGameOver; // 게임이 종료되었는지 아닌지
    public GameObject winUI;

    void Start()
    {
        isGameOver = false;
    }

    
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.Space)) {
            SceneManager.LoadScene("SampleScene");
            // 이름대신에 빌드인덱스 순번 0을 넣어도 됨
        }

        if(isGameOver == true) {
            return;
        }

        int count = 0; // Endpoint 달성 개수
        for(int i = 0; i < 3; i++) {
            if(itemBoxes[i].isOveraped == true) {
                count++;
            }
        }

        if(count >= 3) {
            Debug.Log("게임 승리!!!");
            isGameOver = true;
            winUI.SetActive(true);
        }
    }
}
