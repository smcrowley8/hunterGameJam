extends Area2D

var ghost_pos = Vector2()
export var speed = 300
signal hit_person
signal hit_ghost


func set_position(pos):
	ghost_pos = pos
	$CollisionShape2D.disabled=false


func _on_body_collision(body):
	#send signal to main that ghost is colliding with orc
	emit_signal("hit_ghost")
	#have main send signal to specific orc to stop moving
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ghost_body_entered(body):
	pass # Replace with function body.


func ghost_orc_interaction():
	pass # Replace with function body.
