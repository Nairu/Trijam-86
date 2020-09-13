extends Control

export(NodePath) var game_ui
export(NodePath) var game
export(NodePath) var paddle
export(NodePath) var sun

var started = false
var time = 0

func _ready():
	Engine.time_scale = 1

func _process(delta):
	time += delta
	if Input.is_key_pressed(KEY_SPACE):
		_start()
		
func _input(ev):
	if OS.get_model_name() != 'GenericDevice':
		_start()
	
func _start():
	if time > 0.5:
		if not started:
			started = true
			get_node(game_ui).visible = true
			get_node(game).visible = true
			visible = false

			get_node(paddle).started = true
			get_node(sun).started = true
