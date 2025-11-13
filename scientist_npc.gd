extends Node2D

@onready var label: Label = $Label

func _ready() -> void:
	label.text = ""


func die() -> void:
	queue_free()
func explode() -> void:
	killed = 1
@onready var health_manager: Node2D = $"../../Player/Camera2D/health manager"
var killed = 0
func _process(delta: float) -> void:
	if yes==1:
		label.text = "You seem to be nearly corrupted, drink this potion and you will survive. (enter to accept)"
		if Input.is_action_pressed("ui_accept"):
			
			player.teleport()
			health_manager.start_final()
			real_boss.start_real_boss()
			yes = -1
@onready var player: CharacterBody2D = $"../../Player"
@onready var real_boss: Node2D = $"../../Real Boss"
var yes = 0
func _on_area_2d_body_entered(body: Node2D) -> void:
	if yes ==0 and killed:
		yes = 1
	
		
		
		
