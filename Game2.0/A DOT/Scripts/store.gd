extends Control

onready var point = $Points

func _process(delta: float) -> void:
	point.text = "Points : " + str(PlayerStats.global_score)
