extends CanvasLayer
signal options
var is_paused:bool = false:
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused


func _unhandled_input(event: InputEvent) -> void:
	if Global.can_pause:
		if event.is_action_pressed("Pause"):
			is_paused = !is_paused


func _on_resume_b_pressed():
	is_paused = false



func _on_options_b_pressed():
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
	pass # Replace with function body.


func _on_quit_b_pressed():
	get_tree().quit()
