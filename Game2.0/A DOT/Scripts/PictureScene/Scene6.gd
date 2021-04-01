extends TextureRect

onready var label1 = $Label
onready var label2 = $Label2
onready var label3 = $Label3
onready var texture1 = $TextureRect
onready var timer = $Timer
export(String, FILE) var scene = ""

var count = 0

func _ready() -> void:
	texture1.texture = load("res://Characters/Fish/JellyFish/1.png")
	texture1.flip_h = true
	label2.visible = false
	label1.visible = true
	timer.set_wait_time(5)
	timer.start()
	

func _on_Timer_timeout() -> void:
	count += 1
	if count == 1:
		texture1.texture = load("res://Characters/Sea Horse/Right/Normal/Movement/1.png")
		texture1.flip_h = false
		label2.visible = true
		label1.visible = false
	if count == 2:
		texture1.texture = load("res://Characters/Fish/JellyFish/1.png")
		texture1.flip_h = true
		label3.visible = true
		label2.visible = false
	if count ==3:
		get_tree().change_scene(scene)
		timer.stop()
