extends Node2D

func _ready():
	hide()

func hide():
	for subNode in get_children():
		subNode.hide()
		
	pass
	
func show():
	for subNode in get_children():
		subNode.show()
		
	pass
	
