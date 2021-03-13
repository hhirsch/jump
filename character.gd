extends "res://actor_sprite.gd"
var MOVE_SPEED = 100
var health = 100

func _ready():
	position.y = 575
	pass

func isAlive():
	return health > 0;

func _process(delta):
	if isAlive():
		if Input.is_action_pressed("ui_right"): 
			position.x += MOVE_SPEED * delta
		if Input.is_action_pressed("ui_left"): 
			position.x -= MOVE_SPEED * delta
	updateHearts()
	pass

func updateHearts():
	var gameOverScreen = get_node("./../../hud/game-over-screen")
	if !isAlive():
		gameOverScreen.show()
	else:
		gameOverScreen.hide()
			
	var healthHud = get_node("./../hud/health")
	if health <= 33:
		healthHud.get_node("heart1").visible = false
	if health <= 66:
		healthHud.get_node("heart2").visible = false	
		
	if health > 0:
		healthHud.get_node("heart").visible = true
	else:
		healthHud.get_node("heart").visible = false
		
	if health >= 33:
		healthHud.get_node("heart1").visible = true
	if health >= 66:
		healthHud.get_node("heart2").visible = true	
