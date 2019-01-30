using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFreeMove : MonoBehaviour {

    public float maxUpAng;
    public float minDownAng;
    public float moveSpeed;
    public float rotateSpeed;

    private float _x;
    private float _xAngle
    {
        get
        {
            return _x;
        }
        set
        {
            if (value != _x)
            {
                float xToSet = Mathf.Clamp(value, minDownAng, maxUpAng);
                _x = xToSet;
            }
        }
    }

    private float _y;
    private float _yAngle
    {
        get
        {
            return _y;
        }
        set
        {
            if (value != _y)
            {
                float toSet = (value + 360) % 360;
                _y = toSet;
            }
        }
    }

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKey(KeyCode.W))
            transform.parent.position += transform.forward * moveSpeed * Time.deltaTime;
        if (Input.GetKey(KeyCode.S))
            transform.parent.position -= transform.forward * moveSpeed * Time.deltaTime;

        if (Input.GetKey(KeyCode.D))
            transform.parent.position += transform.right * moveSpeed * Time.deltaTime;
        if (Input.GetKey(KeyCode.A))
            transform.parent.position -= transform.right * moveSpeed * Time.deltaTime;

        if (Input.GetKey(KeyCode.E))
            _yAngle += rotateSpeed * Time.deltaTime;
        if (Input.GetKey(KeyCode.Q))
            _yAngle -= rotateSpeed * Time.deltaTime;
        transform.parent.rotation = Quaternion.Euler(0, _yAngle, 0);

        if (Input.GetKey(KeyCode.F))
            _xAngle += rotateSpeed * Time.deltaTime;
        if (Input.GetKey(KeyCode.R))
            _xAngle -= rotateSpeed * Time.deltaTime;
        transform.localRotation = Quaternion.Euler(_xAngle, 0, 0);
    }
}
