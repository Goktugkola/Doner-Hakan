extends Node2D

var can_skip = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if can_skip:
		if Input.is_action_just_pressed("skip"):
			get_tree().change_scene_to_file("res://Scenes/cutscenes/end.tscn")
	pass


func _on_timer_timeout():
	can_skip = true
	pass # Replace with function body.