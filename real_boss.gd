extends Node2D


func start_real_boss() -> void:
	timer.start()
@onready var timer: Timer = $Timer

@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"

func die() -> void:
	queue_free()
@onready var player: CharacterBody2D = $"../Player"
var dir = 0
var dir2 = 0
var yes = 0
func _process(delta: float) -> void:
	if yes:
		if player.position.x>position.x:
			dir = 1
		else:
			dir = -1
		if player.position.y>position.y:
			dir2 = 1
		else:
			dir2 = -1
		position.x+=dir*1500*delta
		position.y+=dir2*1500*delta
func _on_timer_timeout() -> void:
	if yes==1:
		yes = 0
	else:
		yes = 1
	timer.start()

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	health_manager.major_ouch()
