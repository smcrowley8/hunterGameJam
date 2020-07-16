extends CanvasLayer


#note
	#if you need to have the game pause for a set amount of time
	#you can use create_timer function

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	#wait till message timer has counted down
	yield($MessageTimer, "timeout")
	
	#set up for a new game
	$Message.text="Dodge the\nCreeps!"
	$Message.show()
	#make one shot timer and wait for it to finish
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func pressed():
	pass # Replace with function body.


func timeout():
	pass # Replace with function body.
