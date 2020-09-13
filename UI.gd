extends Control

signal lost_game(score)

var lives = 3
var score = 0

func update_score():
	score += 1
	$Score.text = "Score:  %s" % score
	
	if Engine.time_scale < 2:
		Engine.time_scale = Engine.time_scale + 0.05
	elif Engine.time_scale < 3:
		Engine.time_scale = Engine.time_scale + 0.1
	else:
		Engine.time_scale = 3

func update_lives():
	lives -= 1
	get_tree().root.get_node("/root/Root/AudioManager").play_sound("deplete")
	if lives == 2:
		$Lifes/Life1.visible = false
	if lives == 1:
		$Lifes/Life2.visible = false
	if lives == 0:
		$Lifes/Life3.visible = false
		emit_signal("lost_game", score)
