extends Area2D

signal hit_orc
var dart_vel=Vector2()
var dart_pos=position 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func on_hit_orc(body):
	#check if player, if not continue
	emit_signal("hit_orc")
	pass # Replace with function body.


func hit_orc():
	pass # Replace with function body.
