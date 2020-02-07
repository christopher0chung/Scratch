using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ExplainLerpVsMove : MonoBehaviour
{

    public Transform target;
    public bool lerpTrueMoveFalse;

    void Update()
    {
        if (lerpTrueMoveFalse)
        {
            transform.position = Vector3.Lerp(transform.position, target.position, .05f);
        }
        else
        {
            transform.position = Vector3.MoveTowards(transform.position, target.position, .01f);
        }
    }
}
