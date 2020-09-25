using UnityEngine;
using UnityEngine.UI;
using System.Collections;

[RequireComponent(typeof(Text))]
public class LevelText : MonoBehaviour
{

	private Text text;
	private int level;

	// Use this for initialization
	void Start()
	{
		text = GetComponent<Text>();
	}

	// Update is called once per frame
	void Update()
	{
			level = LevelGenerator.level;
			text.text = "Level: " + level;
	}
}
