extends CollisionShape2D
var cookieCount
var health = 10

func _ready():
	cookieCount = 0
	pass

func _on_Area2D_area_entered(area):
	var zombie = get_node("./../../")
	if area.get_node("./../").name == "spearProjectile":
		if health < 0:
			zombie.hide()
		var spear = get_tree().get_root().get_node("./game/character/spearProjectile")
		var cookie = get_tree().get_root().get_node("./game/hud/cookies")
		cookie.increase(1)
		spear.reset()
		zombie.bleed()
		if health < 0:
			zombie.queue_free()
		else:
			health -= 5
			zombie.push_back()
		pass
	if area.name == "bodyArea" and zombie.attack:
		print("coolided")
		var character = area.get_node("./../")
		character.health -= 5
		print(character.health)
		character.updateHearts()