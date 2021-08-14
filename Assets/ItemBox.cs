using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemBox : MonoBehaviour
{

    public bool isOveraped = false;
    // public으로 해야지 다른친구가 이 변수에 접근가능

    private Renderer myRenderer;
    public Color touchColor;
    private Color originalColor;


    void Start()
    {
        myRenderer = GetComponent<Renderer>();    
        originalColor = myRenderer.material.color;
    }

    
    void Update()
    {
        
    }

    void OnTriggerEnter(Collider other) 
    {
        if(other.tag == "EndPoint") {
            //Debug.Log("EndPoint 충돌");
            isOveraped = true;
            myRenderer.material.color = touchColor;
        }
        
    }

    void OnTriggerExit(Collider other) {
        if(other.tag == "EndPoint") {
            isOveraped = false;
            myRenderer.material.color = originalColor;
        }
    }

    void OnTriggerStay(Collider other) {
        if(other.tag == "EndPoint") {
            isOveraped = true;
            myRenderer.material.color = touchColor;
        }
    }
}

