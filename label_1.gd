extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var timer: Timer = $Timer
@onready var sprite_2d_3: Sprite2D = $Sprite2D3

func double()->void:
	sprite_2d.visible = 1
	sprite_2d_2.visible = 0
	sprite_2d_3.visible = 0
	timer.start()
	
func triple()->void:
	sprite_2d.visible = 0
	sprite_2d_2.visible = 1
	sprite_2d_3.visible = 0
	
func dash()->void:
	sprite_2d.visible = 0
	sprite_2d_2.visible = 0
	sprite_2d_3.visible = 1
	timer.start()
func _on_timer_timeout() -> void:
	sprite_2d.visible = 0
	sprite_2d_2.visible = 0
	sprite_2d_3.visible = 0
	pass # Replace with function body.
