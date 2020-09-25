using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.Characters.FirstPerson;
using UnityEngine.SceneManagement;

public class Despawn : MonoBehaviour
{
    public GameObject player;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (player.transform.position.y < -10)
        {
            LevelGenerator.level = 1;
            DontDestroy.instance.GetComponents<AudioSource>()[0].Pause();
            SceneManager.LoadScene("GameOver");
        }
    }
}
