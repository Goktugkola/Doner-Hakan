extends Node2D

@onready var clock1 = $clock
@onready var clock2 = $clock2
@onready var clock3 = $clock3
@onready var clock4 = $clock4
@onready var clock5 = $clock5
@onready var clock6 = $clock6
@onready var clock7 = $clock7
@onready var clock8 = $clock8
@onready var clock9 = $clock9
@onready var player = $player
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	$music.play()
	clock1.start_clock(2.3)
	$clock/AnimationPlayer.play("clock")
	clock2.start_clock(2.8)
	$clock2/AnimationPlayer.play("clock2")
	clock3.start_clock(4.6)
	$clock3/AnimationPlayer.play("clock3")
	clock4.start_clock(5.6)
	$clock4/AnimationPlayer.play("clock4")
	clock5.start_clock(6.2)
	$clock5/AnimationPlayer.play("clock5")
	clock6.start_clock(7.5)
	$clock6/AnimationPlayer.play("clock6")
	clock7.start_clock(8.1)
	$clock7/AnimationPlayer.play("clock 7")
	clock8.start_clock(9.4)
	$clock8/AnimationPlayer.play("clock 8")
	clock9.start_clock(9.7)
	$clock9/AnimationPlayer.play("clock9")
	Global.clockmax = 9
	Global.clockcount = 0
	$options_menu.position = $StageCam.position
	get_tree().paused = true
	pass # Replace with function body.
func countclock():
	Global.clockcount = Global.clockcount + 1
	player.dashreset()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Global.clockcount == Global.clockmax:
		print(Global.clockcount)
		Global.clockcount = 0
		get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")



func _on_deadzone_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if body == $player:
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_timer_timeout():
	$StageCam.queue_free()
	$countdown.queue_free()
	get_tree().paused = false
	Global.can_pause = true
	pass # Replace with function body.


func _on_clock_take():
	countclock()
	print(Global.clockcount)
pass

func _on_clock_2_take():
	countclock()
	print(Global.clockcount)
pass
func _on_clock_3_take():
	countclock()
	print(Global.clockcount)
pass

func _on_clock_4_take():
	countclock()
	print(Global.clockcount)
pass

func _on_clock_5_take():
	countclock()
	print(Global.clockcount)
	pass # Replace with function body.
	
func _on_clock_6_take():
	countclock()
	print(Global.clockcount)
	
func _on_clock_7_take():
	countclock()
	print(Global.clockcount)
	pass # Replace with function body.
	
func _on_clock_8_take():
	countclock()
	print(Global.clockcount)
	pass # Replace with function body.

func _on_clock_9_take():
	countclock()
	print(Global.clockcount)
	pass # Replace with function body.



func _on_pause_menu_options():
	$options_menu.visible = not $options_menu.visible
	$pause_menu.visible = not $pause_menu.visible
	
	pass # Replace with function body.


func _on_options_menu_options_back():
	$pause_menu.visible = not $pause_menu.visible
	$options_menu.visible = false
	pass # Replace with function body.



func _on_clock_fail():
	
	pass # Replace with function body.


func _on_clock_2_fail():
	pass # Replace with function body.


func _on_clock_3_fail():
	pass # Replace with function body.


func _on_clock_5_fail():
	pass # Replace with function body.













