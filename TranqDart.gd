extends Area2D

signal hit_orc
var direction = Vector2()
##########ID variable and methods might be needed for collissions


func set_pos(pos):
	position=pos
func set_dir(dir):
	direction=dir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	position += direction * delta
	pass


func on_hit_orc(body):
	#check if player, if not continue
	emit_signal("hit_orc")
	pass # Replace with function body.


func hit_orc():
	pass # Replace with function body.


func _on_TranqDart_hit_orc():
	pass # Replace with function body.
