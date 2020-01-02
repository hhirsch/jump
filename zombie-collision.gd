extends CollisionShape2D
var cookieCount
var blood = preload("res://blood.tscn")
func _ready():
	cookieCount = 0
	pass

func _on_Area2D_area_entered(area):
	if area.get_node("./../").name == "spearProjectile":
		var zombie = get_node("./../../")
		zombie.hide()
		var spear = get_tree().get_root().get_node("./game/character/spearProjectile")
		var cookie = get_tree().get_root().get_node("./game/hud/cookies")
		cookie.increase(1)
		spear.reset()
		var bloodNode = blood.instance()
		bloodNode.set_name("blood")
		bloodNode.position = zombie.position
		get_tree().get_root().add_child(bloodNode)
		zombie.queue_free()
		pass