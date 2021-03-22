extends Area2D


const HitEffect = preload("res://Scenes/HitEffect.tscn")

var invincible = false setget set_invincible

onready var timer = $Timer

signal invinciblity_started
signal invinciblity_ended

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invinciblity_started")
	else:
		emit_signal("invinciblity_ended")

func start_invinciblity(duration):
	self.invincible = true
	timer.start(duration)
	

func creta_hit_effect() -> void:
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout() -> void:
	self.invincible = false


func _on_HurtBox_invinciblity_ended() -> void:
	monitorable = true


func _on_HurtBox_invinciblity_started() -> void:
	set_deferred("monitorable", false)
	
