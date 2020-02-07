using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveUpAndDown_KeyboardInput : MonoBehaviour
{

    private Rigidbody _myRB;

    void Start()
    {
        _myRB = GetComponent<Rigidbody>();   
    }

    void Update()
    {
        if (Input.GetKey(KeyCode.W) || Input.GetKey(KeyCode.S))
        {
            _myRB.isKinematic = false;
            if (Input.GetKey(KeyCode.W))
                _myRB.AddForce(Vector3.up * 100);
            if (Input.GetKey(KeyCode.S))
                _myRB.AddForce(-Vector3.up * 100);
        }
        else
            _myRB.isKinematic = true;
    }
}
