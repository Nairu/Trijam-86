extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal update_score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Sun_body_entered(body):
	if body.collidable:
		body.queue_free()
		emit_signal("update_score")
