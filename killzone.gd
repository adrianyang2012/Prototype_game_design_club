extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('ready')
	pass # Replace with function body.

@onready var timer: Timer = $Timer



func _on_body_entered(body: Node2D) -> void:
	timer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
