extends Particles2D

func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "delete")
	timer.set_wait_time(0.25)
	timer.set_one_shot(true)
	timer.start()
	pass

func delete():
	queue_free()
