extends Control

onready var label = $Label1
onready var label2 = $Label2
onready var label3 = $Label3
onready var portal = $Portal
onready var collisonPoratl = $Portal/CollisionShape2D
onready var fish = $Fish
onready var fishHit = $Fish/HitBox/CollisionShape2D
onready var player = $Player

var timer

func _ready() -> void:
	portal.visible = false
	fishHit.disabled = true
	collisonPoratl.disabled = true
	fish.visible = false
	portal.position.x = 55
	portal.position.y = 118

func _init() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 3
	timer.connect("timeout", self, "_timeout")


func _timeout() -> void:
	label3.visible = false
	label.visible = false
	label2.visible = true
	player.move = true
	player.action = true
	fish.visible = true
	collisonPoratl.disabled = false
	portal.visible = true
	timer.stop()


func _on_Portal_body_entered(body: Node) -> void:
	if PlayerStats.score != 1:
		label2.visible = false
		label3.visible = true
		label3.text = "Kill the enemy first!!"
		timer.start()
		timer.wait_time = 0.5
		timer.connect("timeout", self, "_timeout")
