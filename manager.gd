extends Node2D

@onready var win_text: Label = $"Win text"


func change():
	win_text.text = "WIN!!"
