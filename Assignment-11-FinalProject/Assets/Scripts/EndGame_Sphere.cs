using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;

public class EndGame_Sphere : MonoBehaviour
{

	public GameObject player;
	private Text text;
	//private int coins;

	// Use this for initialization
	void Start()
	{

		text = GetComponent<Text>();
		//text.color = new Color(0, 0, 0, 0);
	}

	// Update is called once per frame
	void Update()
	{
		if (player == null)

		{

			//text.color = new Color(0, 0, 0, 1);
			text.text = "You Won!\nPress Space to Menu!";

			Time.timeScale = 0f;

			// jump is space bar by default
			if (Input.GetButtonDown("Jump"))
			{

				// reload entire scene, starting music over again, refreshing score, etc.
				Time.timeScale = 1f;
				SceneManager.LoadScene("MainMenu");
				Cursor.visible = true;
				Cursor.lockState = CursorLockMode.None;
			}

		}

	}

}