extends Node2D

onready var label = $CanvasLayer/Label
onready var label2 = $CanvasLayer/Label2

func _ready() -> void:
	global.level.levels = label.text
	global.level.difficulty = label2.text
