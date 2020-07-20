extends Node2D

export (PackedScene) var Mob
var score
var darts_fired=[]

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()

func _on_TranqDart_hit_orc():
	pass

#connect timer signals
func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func fire():
	#instantiate dart
	darts_fired.append(load('res://TranqDart.tscn').instance())
	#give dart pos
	darts_fired[-1].set_pos($Player.position)
	#give dart velocity based on mouse position
	var mouse_pos = get_viewport().get_mouse_position()
	var dart_vel=Vector2()
	dart_vel.x=mouse_pos.x - $Player.position.x
	dart_vel.y=mouse_pos.y - $Player.position.y
	#do math to find unit vector
	var temp=sqrt(dart_vel.x * dart_vel.x +dart_vel.y*dart_vel.y)
	dart_vel.x *= (2/temp)
	dart_vel.y *= (2/temp)
	#scale numbers so square root of added squares = bigger velocity than player
	#print numbers just to see if its ok
	print("player position at mouse press: ", $Player.position)
	print("mouse position at mouse press: ", mouse_pos)
	print("dart vel after math: ", dart_vel)
	#set direction of dart fired
	darts_fired[-1].set_dir(dart_vel)
	

func ghost_orc_interaction():	
	#make ghost stop moving
	#moake orc stop moving
	pass
func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	
#add enemies and make them move
func _on_MobTimer_timeout():
	#choose random location on path2d
	$MobPath/MobSpawnLocation.offset=randi()
	#create instance
	var mob = Mob.instance()
	add_child(mob)
	#set the mobs direction perpendicular to path
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	#set mobs position randomly
	mob.position =$MobPath/MobSpawnLocation.position
	#add randomness to direction
	direction+=rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	#set the velocity (speed & direction)
	mob.linear_velocity=Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


