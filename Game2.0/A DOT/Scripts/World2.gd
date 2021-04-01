extends Node2D

onready var player1 = $YSort/Player
onready var player2 = $YSort/Player2
onready var player2camera = $YSort/Player2/RemoteTransform2D
onready var playerchange = $YSort/Player2/AnimationPlayer

var postion = Vector2.ZERO

func _ready() -> void:
	player2.visible = true

func _on_Shield_shield() -> void:
	position = player1.position
	player1.queue_free()
	player2.action = true
	playerchange.play("Change")
	player2.move = true
	player2.visible = true
	

func _on_AnimationPlayer_animation_started(anim_name: String) -> void:
	player2camera.position = Vector2.ZERO
	player2.position = position
