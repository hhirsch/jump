extends Sprite

var spearThrown = false
var spearAvailable = true
var spearVector
func _ready():
	reset()
	pass

func reset():
	var character = get_node("./../character/")
	spearThrown = false
	spearAvailable = false
	disarm()
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "make_spear_available")
	timer.set_wait_time(1)
	timer.set_one_shot(true)
	timer.start()

func make_spear_available():
	spearAvailable = true
	var character = get_node("./../character/")
	character.get_node("spear").visible = false

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
	var x = round(Input.get_joy_axis(gamepad, JOY_ANALOG_RX)*10) / 10
	var y = round(Input.get_joy_axis(gamepad, JOY_ANALOG_RY)*10) / 10
	var direction = Vector2(x, y)
	if !spearThrown:
		var angle = direction.angle()
		rotation = angle
		disarm()
		visible = false
	if spearThrown:
		character.get_node("spear").visible = false
		position += spearVector.normalized() * delta * 600
		visible = true
	if !spearAvailable or spearThrown:
		character.get_node("spear").visible = false
	if spearAvailable and !spearThrown:
		character.get_node("spear").visible = true		
	if (Input.is_action_pressed("ui_shoot") && !spearThrown && spearAvailable): 
		position = character.position + Vector2(0, 10)
		spearThrown = true
		spearVector = direction
		arm()
	pass


func _on_VisibilityNotifier2D_screen_exited():
	reset()
	pass
