using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;

public class GameOverText : MonoBehaviour {

	public GameObject helicopter;
	private Text text;
	private int coins;
	private int gems;
	// Use this for initialization
	void Start () {

		text = GetComponent<Text>();
		// start text off as completely transparent black
		text.color = new Color(0, 0, 0, 0);
	}

	// Update is called once per frame
	void Update () {
		if (helicopter != null) {

			Time.timeScale = 1f;

			ScrollingBackground.scrollSpeed = .1f;
			coins = helicopter.GetComponent<HeliController>().coinTotal;
			gems = helicopter.GetComponent<HeliController>().gemTotal;
		}
		else {
			
			// reveal text only when helicopter is null (destroyed)
			text.color = new Color(0, 0, 0, 1);
			text.text = "Game Over\nYour Score:\n" + coins + " Coins\n" + gems + " Gems\n" + "Press Space to Restart!";

			Time.timeScale = 0f;

			// jump is space bar by default
			if (Input.GetButtonDown("Jump")) {

				SkyscraperSpawner.speed = 10f;
				// reload entire scene, starting music over again, refreshing score, etc.
				SceneManager.LoadScene("Main");
			}
		}
	}
}
