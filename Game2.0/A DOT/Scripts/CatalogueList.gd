extends Control

onready var richText = $RichTextLabel/Control
onready var vscroll = $VScrollBar

func _process(delta: float) -> void:
	richText.position.y = -vscroll.value

