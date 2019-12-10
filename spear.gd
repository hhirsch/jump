extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var spearThrown = false
var spearVector
func _ready():
	pass
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#var direction: Vector2
	#direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	#direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	var gamepads = Input.get_connected_joypads()
	var gamepad = 0
	if Input.get_connected_joypads().size() > 0:
		gamepad = gamepads[Input.get_connected_joypads().size() -1]
	var direction = Vector2(Input.get_joy_axis(gamepad, JOY_ANALOG_RX), Input.get_joy_axis(gamepad, JOY_ANALOG_RY))
	if !spearThrown:
		var angle = direction.angle()
		rotation = angle
	if spearThrown:
		position += spearVector * 10
		
	if (Input.is_action_pressed("ui_shoot") && !spearThrown): 
		spearThrown = true
		spearVector = direction
	#if not is_on_screen():	
		
	pass


func _on_VisibilityNotifier2D_screen_exited():
	spearThrown = false
	position = Vector2(0, 0)
	pass # Replace with function body.
