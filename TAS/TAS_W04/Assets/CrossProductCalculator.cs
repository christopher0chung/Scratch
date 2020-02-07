using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class CrossProductCalculator : MonoBehaviour
{
    public Vector3 vectorA;
    public Vector3 vectorB;

    public Vector3 outputVectorACrossB;
    public Vector3 outputVectorBCrossA;

    void Start()
    {
        
    }

    private void Update()
    {
        outputVectorACrossB = Vector3.Cross(vectorA, vectorB);
        outputVectorBCrossA = Vector3.Cross(vectorB, vectorA);
    }
}
