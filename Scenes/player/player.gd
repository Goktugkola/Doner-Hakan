extends CharacterBody2D
signal dir
const SPEED = 170.0
const JUMP_VELOCITY = -300.0
const DOUBLE_JUMP_FORCE = -250
const DASH_SPEED = 500.0
const DASH_TIME = 0.2
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var jump_max = 2
var dashdirection
var dash_count = 0
var dash_max = 1
var hold = false


var fail = false
func dashreset():
	dash_count = 0
@onready var DASH_COOLDOWN = $dash_cooldown
@onready var dash = $dash
@onready var plane = $"../Plane"
func reload():
	get_tree().reload_current_scene()
func _physics_process(delta):

	var direction = Input.get_axis("ui_left", "ui_right")
	# Add the gravity.
	if not is_on_floor() and not dash.is_dashing():
		velocity.y += gravity * delta
	if Input.is_action_pressed("dash") and not dash.is_dashing() and dash_count<dash_max and DASH_COOLDOWN.is_stopped():
		dash_count += 1
		velocity.y = 0
		dashdirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		dash.start_dash(DASH_TIME)
		DASH_COOLDOWN.start(0.4)
		$AnimationPlayer.play("dash")
	if is_on_floor() and jump_count != 0 :
		jump_count = 0
	# Handle Jump.
	if Input.is_action_just_pressed("hold"):
		hold = true
	if Input.is_action_just_released("hold"):
		hold = false
	if is_on_wall() and hold== true:
		$AnimationPlayer.play("grip")
		velocity.y = 0
	if velocity.x == 0 and is_on_floor() and not dash.is_dashing() and fail == false:
		$AnimationPlayer.play("idle")
	if velocity.x!= 0 and is_on_floor() and not dash.is_dashing() and fail == false:
		$AnimationPlayer.play("Run")
	if Input.is_action_just_pressed("ui_accept") and jump_count<jump_max and not dash.is_dashing():
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		$AnimationPlayer.play("jump")
		print("jump")
	if velocity.x<0:
		emit_signal("dir")
		$"Idle-sheet".flip_h = true
		$"Run-sheet".flip_h = true
		$"Dash-sheet".flip_h = true
		$"Jump-sheet".flip_h = true
		$Grip.flip_h = true
		$"Fail-sheet".flip_h = true
	elif velocity.x >0:
		emit_signal("dir")
		$"Fail-sheet".flip_h = false
		$Grip.flip_h = false
		$"Idle-sheet".flip_h =false
		$"Run-sheet".flip_h = false
		$"Dash-sheet".flip_h = false
		$"Jump-sheet".flip_h = false
	if dash.is_dashing():
		velocity.y = dashdirection.y / 2 * DASH_SPEED
		velocity.x = dashdirection.x * DASH_SPEED
		
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()




func _on_plane_entered():
	print("amen")
	pass # Replace with function body.


func _on_plane_exited():
	print("ins")
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):

	if anim_name == "dash":
		$AnimationPlayer.play("dashair")
	if anim_name == "fail" and fail == true:
		reload()


	pass # Replace with function body.


func _on_dir():
	pass # Replace with function body.


func _on_clock_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_2_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_3_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_4_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_5_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_9_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_8_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_7_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.


func _on_clock_6_fail():
	fail = true
	$AnimationPlayer.play("fail")
	pass # Replace with function body.
