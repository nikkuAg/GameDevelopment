extends Label

export(int) var price = 3

func _ready() -> void:
	text = str(price)
