extends CollisionShape2D

func _on_Area2D_area_entered(area):
	var zombie = get_tree().get_root().get_node("./game/zombie/zombie")
	zombie.hide()
	zombie.position = Vector2(0,575)
	zombie.show()
	var spear = get_tree().get_root().get_node("./game/character/character/spear")
	spear.reset()
	pass