extends TextureRect

export(String, FILE) var scene = ""

onready var timer = $Timer

func _ready() -> void:
	timer.set_wait_time(2)
	timer.start()


func _on_Timer_timeout() -> void:
	get_tree().change_scene(scene)
