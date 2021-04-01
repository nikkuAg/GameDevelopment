extends Node

export var max_health = 1 setget set_max_health
var health = max_health setget set_health
var score = 0 setget set_score
var global_score =0
var global_health = 4


signal score_updated
signal no_health
signal health_change(value)
signal max_health_change(value)

func set_health(value):
	health = value
	emit_signal("health_change", health)
	if(health <= 0):
		emit_signal("no_health")

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_change", max_health)
	
func _ready() -> void:
	self.health = max_health

func set_score(value):
	score = value
	emit_signal("score_updated")
