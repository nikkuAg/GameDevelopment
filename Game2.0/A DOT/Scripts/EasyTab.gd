extends Tabs


onready var richText = $RichTextLabel/Control
onready var hscroll = $HScrollBar
onready var panels = $RichTextLabel/Control

func _process(delta: float) -> void:
	richText.position.x = -hscroll.value

func _ready() -> void:
	for n in 4:
		if global.level.levelME[n] == true:
			panels.get_node("Panel" + str(n+1)).get_node('Button').disabled = false
		else:
			panels.get_node("Panel" + str(n+1)).get_node('Button').disabled = true
		panels.get_node("Panel" + str(n+1)).get_node('Full').rect_size.x = global.level.GstarE[n] * 15
		
		
func level(level_no):
	global.load_level()
	global.level.levelME[level_no] = true
	global.save_level()

func _on_Button1_button_up() -> void:
	level(1)
	get_tree().change_scene("res://Scenes/PictureScene/Scene1.tscn")


func _on_Button2_button_up() -> void:
	level(2)
	get_tree().change_scene("res://Scenes/LevelOverlay/Level2.tscn")


func _on_Button3_button_up() -> void:
	level(3)
	get_tree().change_scene("res://Scenes/LevelOverlay/Level3.tscn")


func _on_Button4_button_up() -> void:
	level(0)
	get_tree().change_scene("res://Scenes/LevelOverlay/Level4.tscn")
