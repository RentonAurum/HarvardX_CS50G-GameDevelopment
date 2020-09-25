using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
[RequireComponent(typeof(Text))]
public class SpeedText : MonoBehaviour
{
    //public GameObject helicopter;
    private Text text;
    private float oilas;
    void Start()
    {
        text = GetComponent<Text>();
    }
    void Update()
    {
        oilas = SkyscraperSpawner.speed;
        text.text = "Speed: " + oilas;
    }
}
