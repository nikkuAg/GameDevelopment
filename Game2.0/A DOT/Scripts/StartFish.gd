extends KinematicBody2D

const EnemyDieEffect = preload("res://Scenes/EnemyDeathEffect.tscn")

export var score = 1

onready var sprite = $Sprite
onready var stats = $Stats
onready var hurtbox = $HurtBox

func _on_HurtBox_area_entered(area: Area2D) -> void:
	stats.health -= area.damage
	hurtbox.creta_hit_effect()


func _on_Stats_no_health() -> void:
	queue_free()
	var enemyDieEffect = EnemyDieEffect.instance()
	get_parent().add_child(enemyDieEffect)
	enemyDieEffect.global_position = global_position
	PlayerStats.score += score
