extends CharacterBody2D
const SPEED = 800.0
const JUMP_VELOCITY = -1000.0
var double = 0
var extra_jumps = 0
var floor = 0
@onready var health_manager: Node2D = $"Camera2D/health manager"
@onready var label_1: Node2D = $"Camera2D/Label 1"
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3

var check = 0
var progress = 0
var additional = 0
var started_dash = 1
func change() -> void:
	extra_jumps = 1
func dash() -> void:
	started_dash = 1
	acsess = 1
func _ready() -> void:
	rotation = 0.001
var corruption = 0
var tripled = 0
var acsess = 0
func upgrade()-> void:
	corruption+=1
	health_manager.upgrade()
	if corruption>6 and tripled==0:
		extra_jumps+=1
		tripled = 1
		label_1.triple() 
	if corruption>9 and started_dash==0:
		dash()
		label_1.dash()
func explode()-> void:
	health_manager.explode()
	corruption+=40
func teleport()->void:
	position.x = 2100
	position.y = -8416
func zero_corruption() -> void:
	position.x  = 20670
	position.y = -100
var started = 0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if check==1:
		
		if not is_on_floor():
			
			floor = 0
			
	else:
		
		if not is_on_floor() and not started:
			started = 1
			timer.start()
	if is_on_floor():
		floor = 1
		check = 0
		
	
			
	
	if Input.is_action_just_pressed("ui_up") and (floor or double<extra_jumps):
		velocity.y = JUMP_VELOCITY*(1+0.02*corruption)
		if is_on_floor():
			double = 0
		double+=1
	
	if is_on_floor():
		double = 0
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_select"):
		print(acsess)
		if acsess==1:
			print('set')
			acsess = 0
			additional = 1
			timer_2.start()
		
	if additional==1:
		velocity.x = direction * SPEED*3.2
		velocity.x = move_toward(velocity.x, 0, SPEED*0.15)
	else:
		if direction:
			rotation = 0.001*direction
			velocity.x = direction * SPEED*(1+0.03*corruption+additional)
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED*0.2)
	
	move_and_slide()
	


func _on_timer_timeout() -> void:
	check = 1
	started = 0
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	print('easy')
	acsess = 0
	additional = 0
	timer_3.start()


func _on_timer_3_timeout() -> void:
	
	acsess = 1
	print(acsess)
