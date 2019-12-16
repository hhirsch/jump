extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var spearThrown = false
var spearVector
func _ready():
	reset()
	pass

func reset():
	var character = get_node("./../character/")
	character.get_node("spear").visible = true
	spearThrown = false
	#position = Vector2(0, 10)
	disarm()

func arm():
	var collisionShape = get_node("Area2D/CollisionShape2D")
	collisionShape.disabled = false
	pass

func disarm():
	var collisionShape = get_node("Area2D/CollisionShape2D")
	collisionShape.disabled = true
	pass	
	
func _process(delta):
	var character = get_node("./../character/")
	var gamepads = Input.get_connected_joypads()
	var gamepad = 0
	if Input.get_connected_joypads().size() > 0:
		gamepad = gamepads[Input.get_connected_joypads().size() -1]
	var direction = Vector2(Input.get_joy_axis(gamepad, JOY_ANALOG_RX), Input.get_joy_axis(gamepad, JOY_ANALOG_RY))
	if !spearThrown:
		var angle = direction.angle()
		rotation = angle
		disarm()
		visible = false
	if spearThrown:
		character.get_node("spear").visible = false
		position += spearVector * 10
		visible = true
	if (Input.is_action_pressed("ui_shoot") && !spearThrown): 
		position = character.position + Vector2(0, 10)
		spearThrown = true
		spearVector = direction
		arm()
	pass


func _on_VisibilityNotifier2D_screen_exited():
	reset()
	pass
