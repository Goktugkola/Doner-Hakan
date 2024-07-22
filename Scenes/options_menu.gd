extends Control
signal options_back

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.





func _on_back_pressed():
	$".".visible = not $".".visible
	emit_signal("options_back")
	pass # Replace with function body.


func _on_fullscreenbtn_pressed():
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
	pass # Replace with function body.
