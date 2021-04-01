extends Tabs

onready var richtext = $RichTextLabel/Control
onready var colorRect = $ColorRect
onready var label = $ColorRect/Label

onready var price1 = str2var($RichTextLabel/Control/Panel1/Label.text)
onready var price2 = str2var($RichTextLabel/Control/Panel2/Label.text)
onready var price3 = str2var($RichTextLabel/Control/Panel3/Label.text)
onready var panels = $RichTextLabel/Control


func _ready() -> void:
	global.load_store()
	for item in range(panels.get_child_count()):
		if global.store.bought[item] == true:
			panels.get_node("Panel" + str(item+1)).get_node('Button').text = "Select"
	panels.get_node("Panel" + str(global.store.selectedA+1)).get_node('Button').text = "Selected"
	panels.get_node("Panel" + str(global.store.selectedA+1)).get_node('Button').add_to_group("selectedA")


func buy(price, item_no):
	global.load_store()
	if global.store.bought[item_no]==false:
		if PlayerStats.global_score >= price:
			PlayerStats.global_score -= price
			global.store.bought[item_no] = true
			panels.get_node("Panel" + str(item_no+1)).get_node('Button').text = "Select"
			global.save_store()
		else:
			var rem = price - PlayerStats.global_score
			colorRect.show()
			label.text = "You need " + str(rem) + " more \npoints to buy this itme."
	else:
		selected(panels.get_node("Panel" + str(item_no+1)).get_node('Button'), item_no)
		
		
func selected(node, no):
	global.load_store()
	for button in get_tree().get_nodes_in_group("selectedA"):
		button.text = "Select"
		button.remove_from_group("selectedA")
	node.text = "Selected"
	node.add_to_group("selectedA")
	global.store.selectedA = no
	global.save_store()

func _on_Button1_button_up() -> void:
	buy(price1,0)


func _on_Button2_button_up() -> void:
	buy(price2,1)


func _on_Button3_button_up() -> void:
	buy(price3,2)


func _on_Button_button_up() -> void:
	colorRect.hide()
