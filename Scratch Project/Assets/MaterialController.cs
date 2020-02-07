using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialController : MonoBehaviour
{
    public Material _myMat;

    private float _colorMag;
    private float _min = .06f;
    private float _max = .12f;

    void Update()
    {
        _colorMag = Mathf.Lerp(_colorMag, _min, .1f);

        if (Input.GetKeyDown(KeyCode.Space))
            _colorMag = _max;

        _myMat.SetColor("_TintColor", new Color(_colorMag, _colorMag, _colorMag));
    }
}
