extends CollisionShape2D
var cookieCount

func _ready():
	cookieCount = 0
	pass

func _on_Area2D_area_entered(area):
	if area.get_node("./../").name == "spearProjectile":
		var zombie = get_node("./../../")
		zombie.hide()
		var spear = get_tree().get_root().get_node("./game/character/spearProjectile")
		var cookie = get_tree().get_root().get_node("./game/cookies")
		cookie.increase(1)
		spear.reset()
		zombie.queue_free()
		pass
