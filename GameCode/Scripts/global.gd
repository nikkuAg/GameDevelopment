extends Node

var store = {
			"bought" : [true, false, false],
			"boughtA" : [true, false, false],
			"selected" :0,
			"selectedA" : 0 
}
var save_store_path = 'user://save'

func _ready() -> void:
	load_store()
	for n in 3:
		if n==0:
			store.bought[n] =true
		else:
			store.bought[n] = false
	for n in 3:
		if n==0:
			store.boughtA[n] = true
		else:
			store.boughtA[n] = false
	store.selected = 0
	store.selectedA = 0
	save_store()

func save_store():
	var file = File.new()
	file.open(save_store_path, file.WRITE_READ)
	file.store_var(store)
	file.close()
	
func load_store():
	var file = File.new()
	if not file.file_exists(save_store_path):
		return false
	file.open(save_store_path, file.READ)
	store = file.get_var()
	file.close()
	return true
	
