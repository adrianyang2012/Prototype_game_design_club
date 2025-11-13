extends Area2D

@onready var player: CharacterBody2D = $"../Player"

@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"

func _on_body_entered(body: Node2D) -> void:
	health_manager.long_heal()
	queue_free()
