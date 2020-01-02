extends Sprite
var speed = 10
var blood = preload("res://blood.tscn")

func _process(delta):
	var character = get_tree().get_root().get_node("./game/character/character")
	var moveLenght = (speed*delta)
	if(randi()%11+1 == 10):
		moveLenght += 5
	if (character.position.x - position.x) > 0:
		position.x += moveLenght
		set_flip_h(false)
	if (character.position.x - position.x) < 0:
		position.x -= moveLenght	
		set_flip_h(true)
	pass
	
func bleed():
	var bloodNode = blood.instance()
	bloodNode.set_name("blood")
	bloodNode.position = position
	get_tree().get_root().add_child(bloodNode)
	
func push_back():
	if flip_h:
		position.x += 15
	else:
		position.x -= 15
	pass