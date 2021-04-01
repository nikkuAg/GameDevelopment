extends Control

onready var time = $Timer
onready var label = $Label1
onready var label2 = $Label2
signal time_out

const Time = 2

var timer = 0

func _physics_process(delta: float) -> void:
	timer += delta
	if timer > Time:
		emit_signal("time_out")


func _on_Instruction_time_out() -> void:
	label.visible = false
	label2.visible = true
