extends Control

onready var label = $Label1
onready var label2 = $Label2
onready var portal = $Portal
onready var insPortal = $InstructionPortal
onready var collisonPoratlIns = $InstructionPortal/CollisionShape2D
onready var player = $Player

var count = 0
var timer

func _ready() -> void:
	portal.position.x = 230
	portal.position.y = 338
	
	

func _init() -> void:
		timer = Timer.new()
		add_child(timer)
		timer.autostart = true
		timer.wait_time = 3
		timer.connect("timeout", self, "_timeout")

func _on_InstructionPortal_body_entered(body: Node) -> void:
	if count == 0:
		insPortal.position.x = 15
		insPortal.position.y = 90
		count = 1
	elif count ==1:
		insPortal.position.x = 160
		insPortal.position.y = 30
		count = 2
	elif count== 2:
		insPortal.visible = false
		portal.position.x = 160
		portal.position.y = 165
		collisonPoratlIns.disabled = true
		portal.position.x = 180
		portal.position.y = 155
		portal.visible = true
		

func _timeout() -> void:
	label.visible = false
	label2.visible = true
	player.move = true
	player.action = true
	collisonPoratlIns.disabled = false
	insPortal.visible = true
	timer.stop()
