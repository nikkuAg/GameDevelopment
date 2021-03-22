extends Area2D

export var health_increase = 2

signal shield

func _on_Shield_body_entered(body: Node) -> void:
	queue_free()
	emit_signal("shield")
	PlayerStats.max_health += health_increase
	PlayerStats.health = PlayerStats.max_health
