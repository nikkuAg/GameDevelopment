extends KinematicBody2D


export var acc = 200
export var max_speed = 100
export var frictionKnock = 100
export var frictionMove = 1000
export var WanderRange = 5
export(bool) var movement = true

enum{
	IDLE,
	WANDER,
}

var velocity = Vector2.ZERO
var knock_back = Vector2.ZERO
var state = WANDER

onready var sprite = $Sprite
onready var wanderController = $WanderControler

func _ready() -> void:
	state = pick_random_state([IDLE, WANDER, WANDER, WANDER])

func _physics_process(delta: float) -> void:
	if movement == false:
		state = IDLE
	else:
		knock_back = knock_back.move_toward(Vector2.ZERO, frictionKnock * delta)
		knock_back = move_and_slide(knock_back)
		match state:
			IDLE:
				velocity = velocity.move_toward(Vector2.ZERO, frictionMove * delta)
				if(wanderController.get_time_left() == 0):
					update_state()
				
			WANDER:
				if(wanderController.get_time_left() == 0):
					update_state()
				var direction = global_position.direction_to(wanderController.target_position)
				direction.normalized()
				velocity = velocity.move_toward(direction * max_speed, acc * delta)
				sprite.flip_h = velocity.x > 0
				if global_position.distance_to(wanderController.target_position) <= WanderRange:
					update_state()
		velocity = move_and_slide(velocity)

func update_state():
	state = pick_random_state([IDLE, WANDER, WANDER, WANDER])
	wanderController.start_wander_timer(rand_range(1,10))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
