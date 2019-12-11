extends Sprite
var speed = 50

func _process(delta):
	var character = get_tree().get_root().get_node("./game/character/character")
	if (character.position.x - position.x) > 0:
		position.x += speed*delta
		set_flip_h(false)
	if (character.position.x - position.x) < 0:
		position.x -= speed*delta	
		set_flip_h(true)
	pass
