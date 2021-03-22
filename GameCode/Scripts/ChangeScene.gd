extends TextureButton

export(String, FILE) var scene = ""
export (bool) var reset_score = true
export (bool) var reset_global_score = true


func _on_ChangeScene_button_up() -> void:
	get_tree().change_scene(scene)
	get_tree().paused = false
	if(reset_score == true):
		PlayerStats.score = 0
	if(reset_global_score == true):
		PlayerStats.global_score = 0
		PlayerStats.global_health = 4
