extends AudioStreamPlayer


func _on_PlayerHurtSound_finished() -> void:
	queue_free()
