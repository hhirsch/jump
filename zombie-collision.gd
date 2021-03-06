extends CollisionShape2D
var cookieCount

func _ready():
	cookieCount = 0
	pass

func _on_Area2D_area_entered(area):
	var zombie = get_node("./../../")
	if area.get_node("./../").name == "spearProjectile":
		if zombie.health < 0:
			zombie.hide()
		var spear = get_tree().get_root().get_node("./game/character/spearProjectile")
		var cookie = get_tree().get_root().get_node("./game/hud/cookies")
		cookie.increase(1)
		spear.reset()
		zombie.bleed()
		if zombie.health < 0:
			zombie.queue_free()
		else:
			zombie.health -= 5
			zombie.push_back()
		pass
	if area.name == "bodyArea":
		zombie.attack = true

func _on_Area2D_area_exited(area):
	var zombie = get_node("./../../")
	if area.name == "bodyArea":
		zombie.attack = false
	pass
