extends Button


func _on_RetryButton_button_up() -> void:
	PlayerStats.global_score -= PlayerStats.score
	choseLevel()
	
	
func choseLevel():
	if global.level.difficulty =='E':
		if global.level.levels == '1':
			get_tree().change_scene("res://Scenes/LevelOverlay/Level1.tscn")
		if global.level.levels == '2':
			get_tree().change_scene("res://Scenes/LevelOverlay/Level2.tscn")
		if global.level.levels == '3':
			get_tree().change_scene("res://Scenes/LevelOverlay/Level3.tscn")
		if global.level.levels == '4':
			get_tree().change_scene("res://Scenes/LevelOverlay/Level4.tscn")
	if global.level.difficulty =='H':
		if global.level.levels == '1':
			get_tree().change_scene("res://Scenes/LevelOverlay/Hard/Level1.tscn")
		if global.level.levels == '2':
			get_tree().change_scene("res://Scenes/LevelOverlay/Hard/Level2.tscn")
		if global.level.levels == '3':
			get_tree().change_scene("res://Scenes/LevelOverlay/Hard/Level3.tscn")
		if global.level.levels == '4':
			get_tree().change_scene("res://Scenes/LevelOverlay/Hard/Level4.tscn")
