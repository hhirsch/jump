extends "res://actor_sprite.gd"
var speed = 10
var attack = false

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
		
	if(randi()%11+1 == 10):
		startAttack()
	pass

func startAttack():
	attack = true
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "endAttack")
	timer.set_wait_time(1)
	timer.set_one_shot(true)
	timer.start()	
	
func endAttack():
	attack = false