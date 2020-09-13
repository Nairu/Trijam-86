extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var speed = 10
var heading = Vector2.UP
export(bool) var collidable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var x = sin(rotation)
	var y = -cos(rotation)
	heading = Vector2(x, y)

func _physics_process(delta):
	move_and_collide(heading * speed)
	
func reverse():
	heading *= -1
	rotation_degrees -= 180
	collidable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
