extends TextureRect

onready var label1 = $Label
onready var label2 = $Label2
onready var label3 = $Label3
onready var timer = $Timer
export(String, FILE) var scene = ""

var count = 0

func _ready() -> void:
	self.texture = load("res://Picture Scene/Scene3.png")
	label2.visible = false
	label1.visible = true
	timer.set_wait_time(2)
	timer.start()
	

func _on_Timer_timeout() -> void:
	count += 1
	if count == 1:
		label2.visible = true
		label1.visible = false
	if count == 2:
		self.texture = load("res://Picture Scene/Scene4.png")
		label3.visible = true
		label2.visible = false
	if count ==4:
		get_tree().change_scene(scene)
		timer.stop()


