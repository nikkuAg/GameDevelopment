extends Node

var store = {
			"bought" : [true, false, false],
			"boughtA" : [true, false, false],
			"selected" :0,
			"selectedA" : 0 
}

var level = {
			"levels" : '0',
			"difficulty": '0',
			"levelME" : [true, false, false, false],
			"levelMH" : [true, false, false, false],
			"starE" : [0,0,0,0],
			"starH" : [0,0,0,0],
			"GstarE" : [0,0,0,0],
			"GstarH" : [0,0,0,0]
}

var save_store_path = 'user://save'
var save_level_path = 'user://save1'

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
	load_level()
	level.levels = '0'
	level.difficulty = '0'
	for n in 4:
		if n==0:
			level.levelME[n] = true
			level.levelMH[n] = true
		else:
			level.levelME[n] = false
			level.levelMH[n] = false
		level.starE[n] = 0
		level.starH[n] = 0
		level.GstarE[n] = 0
		level.GstarH[n] = 0
	save_level()


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
	
func save_level():
	var file = File.new()
	file.open(save_level_path, file.WRITE_READ)
	file.store_var(level)
	file.close()
	
func load_level():
	var file = File.new()
	if not file.file_exists(save_level_path):
		return false
	file.open(save_level_path, file.READ)
	level = file.get_var()
	file.close()
	return true
