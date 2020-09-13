extends Node2D

export(PackedScene) var projectile
export(NodePath) var sun_collider
export(float) var starting_speed = 2.0
export(float) var arrow_offset_time = 0.2
export(bool) var started = false
var cur_timer = 0
var cur_arrow_timer = 0
var show_arrow = false
var direction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Game Start")
	cur_timer += starting_speed
	pass # Replace with function body.

func _process(delta):
	if not started:
		return
	
	cur_timer -= delta
	if cur_timer < 0:
		cur_arrow_timer = arrow_offset_time
		direction = rand_range(0, 360)
		$ArrowRotate.rotation_degrees = direction
		$ArrowRotate.visible = true
		cur_timer += starting_speed
	
	_handle_arrow(delta)

func _handle_arrow(delta):
	if $ArrowRotate.visible == false:
		return
	
	cur_arrow_timer -= delta
	if cur_arrow_timer <= 0:
		_fire_projectile()
		$ArrowRotate.visible = false

func _fire_projectile():
	var instance = projectile.instance()
	instance.rotation_degrees = direction
	self.add_child(instance)
	get_tree().root.get_node("/root/Root/AudioManager").play_sound("fire")
