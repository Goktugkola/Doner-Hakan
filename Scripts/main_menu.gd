extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$menumusic.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/cutscenes/beforelevel1.tscn")
	pass # Replace with function body.


func _on_options_pressed():
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_options_menu_options_back():
	$VBoxContainer.visible = not $VBoxContainer.visible
	$options_menu.visible = false
	pass # Replace with function body.
