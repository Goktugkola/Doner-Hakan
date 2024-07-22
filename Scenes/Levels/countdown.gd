extends Control

@export var seconds = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$countdowntext.set_text(str(seconds))
	pass


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_seconds_timeout():
	seconds -=1
	pass # Replace with function body.
