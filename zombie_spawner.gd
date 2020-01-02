extends Node2D

var zombie = preload("res://zombie.tscn")
var timer = null
var zombieCount = 0

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "spawn_zombie")
	timer.set_wait_time(5.0)
	timer.set_one_shot(false) # Make sure it loops
	timer.start()

	pass

func spawn_zombie():
	var zombieNode = zombie.instance()
	zombieNode.set_name("spawned_zombie_" + str(zombieCount))
	zombieCount += 1
	zombieNode.get_node("zombie").position = position
	add_child(zombieNode)