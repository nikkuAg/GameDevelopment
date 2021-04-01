extends KinematicBody2D

const EnemyDieEffect = preload("res://Scenes/EnemyDeathEffect.tscn")

export var acc = 200
export var max_speed = 100
export var frictionKnock = 100
export var frictionMove = 1000
export var WanderRange = 4
export var score = 1
export(bool) var movement = true

enum{
	IDLE,
	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knock_back = Vector2.ZERO
var state = CHASE

onready var sprite = $Sprite
onready var stats = $Stats
onready var playerDetection = $PlayerDetection
onready var hurtbox = $HurtBox
onready var softcollision = $SoftCollision
onready var wanderController = $WanderControler

func _ready() -> void:
	state = pick_random_state([IDLE, WANDER, WANDER])

func _physics_process(delta: float) -> void:
	if movement == false:
		state = IDLE
	else:
		knock_back = knock_back.move_toward(Vector2.ZERO, frictionKnock * delta)
		knock_back = move_and_slide(knock_back)
		match state:
			IDLE:
				velocity = velocity.move_toward(Vector2.ZERO, frictionMove * delta)
				seek_player()
				
				if(wanderController.get_time_left() == 0):
					update_state()
				
			WANDER:
				seek_player()
				if(wanderController.get_time_left() == 0):
					update_state()
				var direction = global_position.direction_to(wanderController.target_position)
				direction.normalized()
				velocity = velocity.move_toward(direction * max_speed, acc * delta)
				sprite.flip_h = velocity.x > 0
				if global_position.distance_to(wanderController.target_position) <= WanderRange:
					update_state()
			CHASE:
				var player = playerDetection.player
				if (player != null) :
					var direction = global_position.direction_to(player.global_position)
					direction.normalized()
					velocity = velocity.move_toward(direction * max_speed, acc * delta)
				else:
					state = IDLE
				sprite.flip_h = velocity.x > 0
		
		if softcollision.is_colliding():
			velocity += softcollision.get_push() * delta * 400
		velocity = move_and_slide(velocity)

func seek_player():
	if (playerDetection.can_see_player()):
		state = CHASE

func update_state():
	state = pick_random_state([IDLE, WANDER])
	wanderController.start_wander_timer(rand_range(1,3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()


func _on_HurtBox_area_entered(area: Area2D) -> void:
	stats.health -= area.damage
	knock_back = area.knock_back_vec * 150
	hurtbox.creta_hit_effect()


func _on_Stats_no_health() -> void:
	queue_free()
	var enemyDieEffect = EnemyDieEffect.instance()
	get_parent().add_child(enemyDieEffect)
	enemyDieEffect.global_position = global_position
	PlayerStats.score += score
