extends Control

export(NodePath) var game_ui
export(NodePath) var game

var gameover = false

func _process(delta):
	if gameover:
		if Input.is_key_pressed(KEY_SPACE):
			_restart()

func game_over(score : float):
	$FinalScore.text = "Final Score: %s" % score
	visible = true
	get_node(game_ui).visible = false
	get_node(game).visible = false
	gameover = true
	Engine.time_scale = 0.01

func _input(ev):
	if OS.get_model_name() != 'GenericDevice':
		_restart()

func _restart():
	get_tree().reload_current_scene()
