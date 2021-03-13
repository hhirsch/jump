extends RichTextLabel
var cookieCount

func _ready():
	cookieCount = 0
	pass

func increase(amount):
	var cookieCounter = get_node("./cookies_count")
	cookieCount = cookieCount + amount
	cookieCounter.set_text(str(cookieCount))
	pass
