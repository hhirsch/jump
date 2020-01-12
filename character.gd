extends "res://actor_sprite.gd"
var MOVE_SPEED = 100
var health = 100

func _ready():
	position.y = 575
	pass

func _process(delta):
	if Input.is_action_pressed("ui_right"): 
		position.x += MOVE_SPEED * delta
	if Input.is_action_pressed("ui_left"): 
		position.x -= MOVE_SPEED * delta
	pass

func updateHearts():
	var healthHud = get_node("./../hud/health")
	if health <= 0:
		healthHud.get_node("heart").visible = false
	if health <= 33:
		healthHud.get_node("heart1").visible = false
	if health <= 66:
		healthHud.get_node("heart2").visible = false	
		
	if health >= 0:
		healthHud.get_node("heart").visible = true
	if health >= 33:
		healthHud.get_node("heart1").visible = true
	if health >= 66:
		healthHud.get_node("heart2").visible = true	