extends Node2D


func _on_AudioStreamPlayer_finished() -> void:
	get_tree().change_scene("res://Scenes/Main.tscn")
