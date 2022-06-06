extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_score(score):
	$ScoreLabel.text = str(score)

func show_message(message):
	$Message.text = message
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over!")
	yield($MessageTimer, "timeout") # wait until MessageTimer counts down
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout") # sleep for one second
	$StartButton.show()

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func new_game():
	pass # Replace with function body.
