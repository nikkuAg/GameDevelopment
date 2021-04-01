extends TextureRect


onready var timer = $Timer

var count = -2

func _ready() -> void:
	timer.set_wait_time(0.25)
	timer.start()
	

func _on_Timer_timeout() -> void:
	count += 1
	if count == 1:
		self.texture = load("res://Picture Scene/Scene9(2).png")
	if count == 2:
		self.texture = load("res://Picture Scene/Scene9(3).png")
	if count == 3:
		self.texture = load("res://Picture Scene/Scene9(4).png")
	if count == 4:
		self.texture = load("res://Picture Scene/Scene9(5).png")
	if count == 5:
		self.texture = load("res://Picture Scene/Scene10(1).png")
	if count == 6:
		self.texture = load("res://Picture Scene/Scene10(2).png")
	if count == 7:
		self.texture = load("res://Picture Scene/Scene10(3).png")
	if count == 8:
		self.texture = load("res://Picture Scene/Scene10(4).png")
	if count == 11:
		get_tree().change_scene("res://Scenes/Win.tscn")
		timer.stop()
