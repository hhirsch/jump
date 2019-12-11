extends Sprite
var MOVE_SPEED = 100;

func _ready():
	position.y = 575
	pass

func _process(delta):
#	if (position.y < 575):
#		position.y += 100 * delta
#	if (position.y > 575):
#		position.y = 575
	if Input.is_action_pressed("ui_right"): 
		position.x += MOVE_SPEED * delta
		#get_child(0).position.x = position.x
	if Input.is_action_pressed("ui_left"): 
		position.x -= MOVE_SPEED * delta
#	if (position.y == 575):
#		if Input.is_action_pressed("ui_accept"): 
#			position.y -= 2000 * delta
	pass
