extends CollisionShape2D

@onready var node_2d: Node2D = $"../../Player/Camera2D/Node2D"

func _ready() -> void:
	position.x = 30000
	position.y = 200
func no_corruption() -> void:
	position.x = 20913
	position.y = -200
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	node_2d.change()
