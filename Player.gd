extends Area2D

signal hit
signal shoot
export var speed = 400 #now in property list
var screen_size
var ammo=30
var dart_arr=Array()


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled=false



func _on_Player_body_entered(body):
    hide()  # Player disappears after being hit.
    emit_signal("hit")
    $CollisionShape2D.set_deferred("disabled", true)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size  = get_viewport_rect().size
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	#movement
	if Input.is_action_pressed("ui_right"):
		velocity.x +=1
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
		
	#fireing bullet
	if Input.is_key_pressed(KEY_SPACE):
		emit_signal("shoot")
		pass
	#animation
	if velocity.x != 0:
		$AnimatedSprite.animation="walk"
		$AnimatedSprite.flip_h=velocity.x<0
	elif velocity.y!=0:
		$AnimatedSprite.animation="up"
		$AnimatedSprite.flip_v=velocity.y>0
	if velocity.length()>0:
		velocity = velocity.normalized() *speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	

