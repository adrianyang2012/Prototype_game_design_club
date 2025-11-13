extends Area2D

@onready var label: Label = $Label
@onready var timer: Timer = $Label/Timer
var hammer = 0
func update() -> void:
	hammer = 1
@onready var player: CharacterBody2D = $"../Player"
@onready var label_1: Node2D = $"../Player/Camera2D/Label 1"

func _on_body_entered(body: Node2D) -> void:
	if hammer==0:
		label.text = "hello, you can get double jump with this special potion, but I need a hammer! If you can give me one, i will give you double jump."
		print('yes')
	else:
		player.change()
		label_1.double()
		label.text = "Wow, you got the hammer! Now, i can make the potion and give you double jump"
	timer.start()


func _on_timer_timeout() -> void:
	label.text = ""
	
