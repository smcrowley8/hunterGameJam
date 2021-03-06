extends Node2D

export (PackedScene) var Mob
var score


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")

#connect timer signals
func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
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


