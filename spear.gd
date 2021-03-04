extends Sprite

var spearThrown = false
var spearVector
func _ready():
	reset()
	pass

func reset():
	spearThrown = false
	visible = false
	position = Vector2(0, 10)
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
	var gamepads = Input.get_connected_joypads()
	var gamepad = 0
	if Input.get_connected_joypads().size() > 0:
		gamepad = gamepads[Input.get_connected_joypads().size() -1]
	var x = round(Input.get_joy_axis(gamepad, JOY_ANALOG_RX)*100) / 100
	var y = round(Input.get_joy_axis(gamepad, JOY_ANALOG_RY)*100) / 100
	var direction = Vector2(x, y)
	var character = get_node("./../")
	if direction.x > 0:
		character.set_flip_h(false)
	if direction.x < 0:
		character.set_flip_h(true)		
	var angle = direction.angle()
	rotation = angle
	pass

func _on_VisibilityNotifier2D_screen_exited():
	reset()
	pass
