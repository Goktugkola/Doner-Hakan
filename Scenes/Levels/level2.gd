extends Node2D
@onready var clock1 = $clock
@onready var clock2 = $clock2
@onready var clock3 = $clock3
@onready var clock4 = $clock4
@onready var clock5 = $clock5
@onready var clock6 = $clock6
@onready var player = $player
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	clock1.start_clock(2.3)
	$clock/AnimationPlayer.play("clock2")
	clock2.start_clock(3.6)
	$clock2/AnimationPlayer.play("clock3")
	clock3.start_clock(4.1)
	$clock3/AnimationPlayer.play("clock4")
	clock4.start_clock(5.7)
	$clock4/AnimationPlayer.play("clock6")
	clock5.start_clock(7.3)
	$clock5/AnimationPlayer.play("clock7")
	clock6.start_clock(8.2)
	$clock6/AnimationPlayer.play("clock8")
	Global.clockmax = 6
	Global.clockcount = 0
	pass # Replace with function body.
func countclock():
	Global.clockcount = Global.clockcount + 1
	player.dashreset()

func _process(_delta):
	if Global.clockcount == Global.clockmax:
		get_tree().change_scene_to_file("res://Scenes/cutscenes/beforend.tscn")
	pass


func _on_deadzone_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if body == $player:
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_timer_timeout():
	$StageCam.queue_free()
	pass # Replace with function body.


func _on_clock_take():
	countclock()
	pass # Replace with function body.


func _on_clock_2_take():
	countclock()
	pass # Replace with function body.


func _on_clock_3_take():
	countclock()
	pass # Replace with function body.



func _on_clock_4_take():
	countclock()
	pass # Replace with function body.


func _on_clock_5_take():
	countclock()
	pass # Replace with function body.


func _on_clock_6_take():
	countclock()
	pass # Replace with function body.
