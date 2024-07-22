extends Node2D
signal entered
signal exited
@export var Direction = 1
const p_speed = 210
@export var velocity:= Vector2()

func _physics_process(delta):
	velocity = Vector2(p_speed , 0)
	
	self.translate(velocity * delta * Direction)


func _on_area_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	emit_signal("entered")
	pass # Replace with function body.


func _on_area_body_shape_exited(_body_rid, _body, _body_shape_index, _local_shape_index):
	emit_signal("exited")
	pass # Replace with function body.
