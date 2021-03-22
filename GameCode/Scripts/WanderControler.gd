extends Node2D

export(int) var wander_range  = 32

onready var start_position = global_position
onready var target_position = global_position
onready var timer = $Timer

func _ready() -> void:
	update_target_postion()

func update_target_postion():
	var target_vec = Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range,wander_range))
	target_position  = start_position + target_vec

func get_time_left():
	return timer.time_left

func start_wander_timer(duration):
	timer.start(duration)

func _on_Timer_timeout() -> void:
	update_target_postion()
