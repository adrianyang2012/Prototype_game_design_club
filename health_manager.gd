extends Node2D
@onready var health_amount: Label = $"health amount"

@onready var player: CharacterBody2D = $"../.."


@onready var boss_health: Label = $"Boss health"
var max_health = 150
var cur_health = max_health
var cur_touch = 0
var bossfight = 0
var bosshealth = 150
var corruption = 0
func boss() -> void:
	bossfight = 1
func ouch() -> void:
	cur_touch+=1
func upgrade() ->void:
	corruption+=1
func explode()-> void:
	corruption+=40
func bossouch() -> void:
	if randf()*10<corruption:
		bosshealth-=5
	bosshealth-=1
	
var longheal = 0
@onready var timer: Timer = $Timer
@onready var ui: CanvasLayer = $"../../../UI"

func long_heal() -> void:
	longheal = 1
	timer.start()


func unouch() -> void:
	cur_touch-=1
func heal() -> void:
	cur_health+=25
	if cur_health>max_health:
		cur_health = max_health
	ui.increase2()
# Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var boss_scene: Area2D = $"../../../Boss"
@onready var real_boss: Node2D = $"../../../Real Boss"

func major_ouch()->void:
	cur_health-=50
	ui.decrease2()
var getout = 0
func start_final()->void:
	getout = 1
@onready var collision_shape_2d: CollisionShape2D = $"../../../Area2D/CollisionShape2D"
@onready var corruption_manager: Node2D = $"../corruption manager"

func _process(delta: float) -> void:
	if bossfight:
		if bosshealth<1:
			bossfight = 0
			boss_scene.die()
	if getout==1:
		
		if randf()>0.98:
			corruption_manager.decrease()
			corruption-=1
		print(corruption)
		if corruption<1:
			print('boss death')
			real_boss.die()
			getout = 0
			collision_shape_2d.no_corruption()
			player.zero_corruption()
			
	cur_health+=longheal
	for i in range(longheal):
		ui.increase()
	if cur_health>max_health:
		cur_health = max_health
	if corruption>45 and getout==0:
		if randf()>0.92:
			cur_health-=1
			ui.decrease()
	cur_health-=cur_touch
	for i in range(cur_touch):
		ui.decrease()
	if cur_health<1:
		get_tree().reload_current_scene()
	health_amount.text = "Health: "+str(int((float(cur_health)/max_health)*100))
	if bossfight==1:
		boss_health.text = "Health: "+str(int((float(bosshealth)/150)*100))
	else:
		boss_health.text = ""


func _on_timer_timeout() -> void:
	longheal = 0
func restart() -> void:
	timer.start()
