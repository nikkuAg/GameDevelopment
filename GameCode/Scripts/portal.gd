extends Area2D

export var max_score = 1
export (String, FILE) var change_scene = ""
onready var animation = $AnimationPlayer

func _on_icon_body_entered(body: Node) -> void:
	if(PlayerStats.score >= max_score):
		animation.play("fade")
		PlayerStats.global_score += PlayerStats.score

func change_Scene():
	get_tree().change_scene(change_scene)
	PlayerStats.score = 0
	PlayerStats.global_health = PlayerStats.health
