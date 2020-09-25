using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
public class Plat : MonoBehaviour {


    private bool MovingRight = true;
    public float speed = 0.5f;

    private void Start()
    {
        
    }
    private void Update()
    {
        Move();
    }

    void Move()
    {
        if (MovingRight)

        {
            transform.Translate(0.05f, 0, 0 * Time.deltaTime * speed);
        }

        else if (MovingRight == false)

        {
            transform.Translate(-0.05f, 0, 0 * Time.deltaTime * speed);
        }

    }

    private void OnTriggerEnter(Collider other)
    {

        if (other.gameObject.CompareTag("Player"))
        
        {
            other.transform.parent = transform;
        }


        if (other.gameObject.CompareTag("Plat_Col"))

        {

            if (MovingRight)

            {
                MovingRight = false;
            }

            else

            {
                MovingRight = true;
            }


        }

    }

    private void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            other.transform.parent = null;
        }
            
    }

}
