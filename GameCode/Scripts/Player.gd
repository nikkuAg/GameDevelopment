extends KinematicBody2D

const PlayerHurtSound = preload("res://Scenes/PlayerHurtSound.tscn")


export var friction = 500
export var acc = 500
export var Max_speed = 150
export var health = 4
export(bool) var move = true
export(bool) var action = true

enum {
	MOVE,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
var stats = PlayerStats
var animationTree
var animationState

onready var animationplayer = $AnimationPlayerGreen
onready var swordHitbox = $HitBoxPivot/HitBox
onready var hurtbox = $HurtBox


func _ready() -> void:
	randomize()
	if global.store.selected == 0 and global.store.selectedA == 0:
		animationTree = $AnimationsTrees/AnimationTree00
	if global.store.selected == 0 and global.store.selectedA == 1:
		animationTree = $AnimationsTrees/AnimationTree10
	if global.store.selected == 0 and global.store.selectedA == 2:
		animationTree = $AnimationsTrees/AnimationTree20
	if global.store.selected == 1 and global.store.selectedA == 0:
		animationTree = $AnimationsTrees/AnimationTree01
	if global.store.selected == 1 and global.store.selectedA == 1:
		animationTree = $AnimationsTrees/AnimationTree11
	if global.store.selected == 1 and global.store.selectedA == 2:
		animationTree = $AnimationsTrees/AnimationTree21
	if global.store.selected == 2 and global.store.selectedA == 0:
		animationTree = $AnimationsTrees/AnimationTree02
	if global.store.selected == 2 and global.store.selectedA == 1:
		animationTree = $AnimationsTrees/AnimationTree12
	if global.store.selected == 2 and global.store.selectedA == 2:
		animationTree = $AnimationsTrees/AnimationTree22
	animationTree.active = true
	stats.connect("no_health", self, "die_player")
	PlayerStats.max_health  = health
	PlayerStats.health = PlayerStats.global_health
	animationState  = animationTree.get("parameters/playback")

	
	

func _physics_process(delta: float) -> void:
		match state:
			MOVE:
				moveState(delta)
			ATTACK:
				if action==true:
					attackState(delta)

		
func moveState(delta):
	var input_vector = Vector2.ZERO
	if move==true:
		input_vector.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	else:
		input_vector = Vector2.ZERO
	input_vector = input_vector.normalized()
	
	if input_vector!=Vector2.ZERO:
		swordHitbox.knock_back_vec = input_vector
		animationState.travel("Run")
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		velocity = velocity.move_toward(input_vector * Max_speed, acc * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move()
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attackState(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func move():
	velocity = move_and_slide(velocity)

func die_player():
	queue_free()
	PlayerStats.global_score += PlayerStats.score
	get_tree().change_scene("res://Scenes/Die.tscn")

func attack_animation_finished():
	state = MOVE

func _on_HurtBox_area_entered(area: Area2D) -> void:
	stats.health -= area.damage
	hurtbox.start_invinciblity(0.5)
	hurtbox.creta_hit_effect()
	var palyerHurtSound = PlayerHurtSound.instance()
	get_tree().current_scene.add_child(palyerHurtSound)
	
