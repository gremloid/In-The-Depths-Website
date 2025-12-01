extends Node2D

var current_half_x = 'none'
var current_half_y = 'none'

func _process(delta):
	# 1. Get the current mouse position in the viewport
	var mouse_pos = get_viewport().get_mouse_position()

	# 2. Get the width of the viewport
	var viewport_width = get_viewport_rect().size.x
	var viewport_height = get_viewport_rect().size.y

	# 3. Calculate the midpoint
	var midpoint_x = viewport_width / 2
	var midpoint_y = viewport_height / 2

	# 4. Compare the mouse position to the midpoint
	if mouse_pos.x < midpoint_x:
		if current_half_x != 'left':
			if current_half_x == 'right':
				camera_left()
			current_half_x = 'left'
			camera_left()
	elif mouse_pos.x > midpoint_x:
		if current_half_x != 'right':
			if current_half_x == 'left':
				camera_right()
			current_half_x = 'right'
			camera_right()
	
	if mouse_pos.y > midpoint_y:
		if current_half_y != 'bottom':
			if current_half_y == 'top':
				camera_down()
			current_half_y = 'bottom'
			camera_down()
	elif mouse_pos.y < midpoint_y:
		if current_half_y != 'top':
			if current_half_y == 'bottom':
				camera_up()
			current_half_y = 'top'
			camera_up()

func camera_down():
	$Camera2D.global_position.y += 20

func camera_up():
	$Camera2D.global_position.y -= 20

func camera_left():
	$Camera2D.global_position.x -= 20

func camera_right():
	$Camera2D.global_position.x += 20
