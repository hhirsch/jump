extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(area):
	var zombie = get_tree().get_root().get_node("./game/zombie/zombie")
	zombie.hide()
	zombie.position = Vector2(0,575)
	zombie.show()
	pass # Replace with function body.
