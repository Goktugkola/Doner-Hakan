extends Node2D
var took = false
signal take
signal fail
var once = true
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func start_clock(dur):
	timer.wait_time = dur
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if timer.is_stopped() and !took:
		$AnimationPlayer.play("watch_break")
		emit_signal("fail")


func _on_area_2d_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	took = true
	if once:
		emit_signal("take")
		$AnimationPlayer.play("c_pickup")
		once=false
	

	
		
			




func _on_animation_player_animation_finished(_watch_break):
	queue_free()


