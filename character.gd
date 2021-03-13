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
		var gamepads = Input.get_connected_joypads()
		var gamepad = 0
		if Input.get_connected_joypads().size() > 0:
			gamepad = gamepads[Input.get_connected_joypads().size() -1]
			position.x += Input.get_joy_axis(gamepad, JOY_ANALOG_LX) * 1.5
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
