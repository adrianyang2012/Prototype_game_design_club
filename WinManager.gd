extends Node2D

@onready var win_text: Label = $"Player/Camera2D/Node2D/Win text"


func change():
	win_text.text = "you win!!"
