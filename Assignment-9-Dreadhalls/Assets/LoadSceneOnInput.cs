using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadSceneOnInput : MonoBehaviour
{

	// Use this for initialization
	void Start()
	{

	}

	// Update is called once per frame
	void Update()
	{
		if (Input.GetAxis("Submit") == 1)
		{
			// TASK 2
			if (SceneManager.GetActiveScene().name == "Title")
            {
				SceneManager.LoadScene("Play");
			}
			else if (SceneManager.GetActiveScene().name == "GameOver")
            {
				DontDestroy.instance.GetComponents<AudioSource>()[0].Pause();
				SceneManager.LoadScene("Title");
			}
		}
	}
}
