extends TextureRect

onready var label1 = $Label
onready var label2 = $Label2
onready var label3 = $Label3
onready var label4 = $Label4
onready var timer = $Timer
export(String, FILE) var scene = ""

var count = 0

func _ready() -> void:
	label2.visible = false
	label1.visible = true
	timer.set_wait_time(5)
	timer.start()
	

func _on_Timer_timeout() -> void:
	count += 1
	if count == 1:
		self.texture = load("res://Picture Scene/Scen5(2).png")
		label2.visible = true
		label1.visible = false
	if count == 2:
		self.texture = load("res://Picture Scene/Scen5(3).png")
		label3.visible = true
		label2.visible = false
	if count ==3:
		self.texture = load("res://Picture Scene/Scen5(4).png")
		label4.visible = true
		label3.visible = false
	if count ==4:
		get_tree().change_scene(scene)
		timer.stop()
