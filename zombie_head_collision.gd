extends CollisionShape2D

func _on_head_area_area_entered(area):
	var zombie = get_node("./../../")
	if area.get_node("./../").name == "spearProjectile":
		if zombie.health < 0:
			zombie.hide()
		var spear = get_tree().get_root().get_node("./game/character/spearProjectile")
		var cookie = get_tree().get_root().get_node("./game/hud/cookies")
		cookie.increase(2)
		spear.reset()
		zombie.bleed()
		if zombie.health > 0:
			zombie.health -= 15
			zombie.push_back()
			
		if zombie.health < 0:
			zombie.queue_free()
		pass
