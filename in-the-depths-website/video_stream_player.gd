extends VideoStreamPlayer

func _ready() -> void:
	paused = true
	set_stream_position(0)
	$HSlider.max_value = get_stream_length()
	$HSlider.min_value = 0

func _process(delta: float) -> void:
	$HSlider.value = get_stream_position()


func _on_pause_pressed() -> void:
	if paused:
		paused = false
	else:
		paused = true

func _on_reset_pressed() -> void:
	set_stream_position(0)
	$HSlider.value = 0
