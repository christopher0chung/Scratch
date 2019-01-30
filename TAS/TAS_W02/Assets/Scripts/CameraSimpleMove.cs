using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraSimpleMove : MonoBehaviour {

    public float swingMag;
    public float frequencyScalar;

    private Vector3 positionAnchor;
    private Vector3 positionToSet;

	// Use this for initialization
	void Start () {
        positionAnchor = transform.position;
    }
	
	// Update is called once per frame
	void Update () {
        positionToSet = positionAnchor + Vector3.forward * Mathf.Sin(Time.time * frequencyScalar) * swingMag;

        transform.position = positionToSet;
	}
}
