extends TextureRect

onready var label1 = $Label
onready var timer = $Timer
export(String, FILE) var scene = ""

func _ready() -> void:
	
	label1.visible = true
	timer.set_wait_time(3)
	timer.start()
	

func _on_Timer_timeout() -> void:
	get_tree().change_scene(scene)
	timer.stop()
