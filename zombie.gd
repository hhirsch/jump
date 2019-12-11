extends Sprite
var speed = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var character = get_node("root")
	var character = get_tree().get_root().get_node("./game/character/character")
	if (character.position.x - position.x) > 0:
		position.x += speed*delta
		set_flip_h(false)
	if (character.position.x - position.x) < 0:
		position.x -= speed*delta	
		set_flip_h(true)
	pass
