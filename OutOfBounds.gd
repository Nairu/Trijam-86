extends Node2D

signal lose_life

func _on_body_entered(body):
	print("Encountered a missed projectile!")
	emit_signal("lose_life")
	body.queue_free()
