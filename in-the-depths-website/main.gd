extends Node2D

var current_half_x = 'none'
var current_half_y = 'none'
var is_dark_mode = false

var offset = 80

@onready var center = $CenterNodes/MainPageCenter.global_position

func _ready():
	$Credits/Roles.modulate = 'WHITE'

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
	if mouse_pos.x < midpoint_x - offset:
		if current_half_x != 'left':
			if current_half_x == 'right':
				camera_left()
			current_half_x = 'left'
			camera_left()
	elif mouse_pos.x > midpoint_x + offset:
		if current_half_x != 'right':
			if current_half_x == 'left':
				camera_right()
			current_half_x = 'right'
			camera_right()
	else:
		current_half_x = 'none'
		center_camera_x()
	
	if mouse_pos.y > midpoint_y + offset:
		if current_half_y != 'bottom':
			if current_half_y == 'top':
				camera_down()
			current_half_y = 'bottom'
			camera_down()
	elif mouse_pos.y < midpoint_y - offset:
		if current_half_y != 'top':
			if current_half_y == 'bottom':
				camera_up()
			current_half_y = 'top'
			camera_up()
	else:
		current_half_y = 'none'
		center_camera_y()

func camera_down():
	$Camera2D.global_position.y += 20

func camera_up():
	$Camera2D.global_position.y -= 20

func camera_left():
	$Camera2D.global_position.x -= 20

func camera_right():
	$Camera2D.global_position.x += 20

func center_camera_y():
	$Camera2D.global_position.y = center.y

func center_camera_x():
	$Camera2D.global_position.x = center.x

func _on_dark_mode_button_pressed() -> void:
	if is_dark_mode:
		$AnimationPlayer.play('light_mode')
		is_dark_mode = false
	else:
		$AnimationPlayer.play('dark_mode')
		is_dark_mode = true

func _on_home_button_pressed() -> void:
	center = $CenterNodes/MainPageCenter.global_position
	$Camera2D.position_smoothing_speed = 5
	center_camera_x()
	center_camera_y()
	$Camera2D.position_smoothing_speed = 2

func _on_gallery_pressed() -> void:
	center = $CenterNodes/GalleryCenter.global_position
	$Camera2D.position_smoothing_speed = 5
	center_camera_x()
	center_camera_y()
	$Camera2D.position_smoothing_speed = 2

func _on_credits_pressed() -> void:
	center = $CenterNodes/CreditsCenter.global_position
	$Camera2D.position_smoothing_speed = 5
	center_camera_x()
	center_camera_y()
	$Camera2D.position_smoothing_speed = 2

func _on_previous_pressed() -> void:
	$AnimationPlayer.play('credits_fade_out')
	await $AnimationPlayer.animation_finished
	$Credits.previous_pressed()
	$AnimationPlayer.play('credits_fade_in')

func _on_next_pressed() -> void:
	$AnimationPlayer.play('credits_fade_out')
	await $AnimationPlayer.animation_finished
	$Credits.next_pressed()
	$AnimationPlayer.play('credits_fade_in')

func _on_development_pressed() -> void:
	center = $CenterNodes/DevelopmentCenter.global_position
	$Camera2D.position_smoothing_speed = 5
	center_camera_x()
	center_camera_y()
	$Camera2D.position_smoothing_speed = 2

func _on_how_2_play_pressed() -> void:
	center = $CenterNodes/How2PlayCenter.global_position
	$Camera2D.position_smoothing_speed = 5
	center_camera_x()
	center_camera_y()
	$Camera2D.position_smoothing_speed = 2

func _on_play_button_pressed() -> void:
	if OS.has_feature('JavaScript'):
		JavaScriptBridge.eval("""
			window.open(https://gremloid.github.io/)
		""")
	else:
		OS.shell_open('https://gremloid.github.io/')
