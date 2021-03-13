extends Sprite
var blood = preload("res://blood.tscn")
	
func push_back():
	if flip_h:
		position.x += 15
	else:
		position.x -= 15
	pass		
	
func bleed():
	var bloodNode = blood.instance()
	bloodNode.set_name("blood")
	bloodNode.position = position
	get_tree().get_root().add_child(bloodNode)
