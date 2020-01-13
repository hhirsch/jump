extends "res://actor_sprite.gd"
var speed = 10
var attack = false
var health = 10

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
	
	if(attack):
		if(randi()%11+1 == 10):
			attack()
		pass

func attack():
	var character = get_tree().get_root().get_node("./game/character/character")
	character.push_back()
	character.bleed()
	character.health -= 5
