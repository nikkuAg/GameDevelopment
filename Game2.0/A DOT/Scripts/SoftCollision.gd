extends Area2D

func is_colliding():
	var area  = get_overlapping_areas()
	return area.size() >0

func get_push():
	var areas = get_overlapping_areas()
	var push = Vector2.ZERO
	if is_colliding():
		var area = areas[0]
		push = area.global_position.direction_to(global_position)
		push = push.normalized()
	return push
