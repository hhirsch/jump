extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var spearThrown = false
var spearVector
func _ready():
	pass

func reset():
	spearThrown = false
	position = Vector2(0, 0)
	
func _process(delta):
	var gamepads = Input.get_connected_joypads()
	var gamepad = 0
	if Input.get_connected_joypads().size() > 0:
		gamepad = gamepads[Input.get_connected_joypads().size() -1]
	var direction = Vector2(Input.get_joy_axis(gamepad, JOY_ANALOG_RX), Input.get_joy_axis(gamepad, JOY_ANALOG_RY))
	var character = get_tree().get_root().get_node("./game/character/character")
	if direction.x > 0:
		character.set_flip_h(false)
	if direction.x < 0:
		character.set_flip_h(true)		
	if !spearThrown:
		var angle = direction.angle()
		rotation = angle
	if spearThrown:
		position += spearVector * 10
	if (Input.is_action_pressed("ui_shoot") && !spearThrown): 
		spearThrown = true
		spearVector = direction
	pass


func _on_VisibilityNotifier2D_screen_exited():
	reset()
	pass
