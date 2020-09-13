extends Node2D

export(Color) var pressed
export(Color) var released
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var speed = PI * 2
export(bool) var started = false

var left = false
var right = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if not started:
		return
	
	if Input.is_key_pressed(KEY_A) or left:
		rotate(-delta*speed)
		$PaddleImg/Images/AImg.modulate = pressed
		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonA").modulate = pressed
	else:
		$PaddleImg/Images/AImg.modulate = released
		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonA").modulate = released
	
	if Input.is_key_pressed(KEY_D) or right:
		rotate(delta*speed)
		$PaddleImg/Images/DImg.modulate = pressed
		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonD").modulate = pressed
	else:
		$PaddleImg/Images/DImg.modulate = released
		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonD").modulate = released
	
#	if left:
#		rotate(-delta*speed)
#		$PaddleImg/Images/AImg.modulate = pressed
#		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonA").modulate = pressed
#	else:
#		$PaddleImg/Images/AImg.modulate = released
#		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonA").modulate = released
#
#	if right:
#		rotate(delta*speed)
#		$PaddleImg/Images/DImg.modulate = pressed
#		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonD").modulate = pressed
#	else:
#		$PaddleImg/Images/DImg.modulate = released
#		get_tree().root.get_node("/root/Root/GameUI/Buttons/ButtonD").modulate = released

func _on_PaddleCollider_body_entered(body):
	body.reverse()
	get_tree().root.get_node("/root/Root/AudioManager").play_sound("collision")

func _on_ButtonA_button_down():
	left = true

func _on_ButtonA_button_up():
	left = false

func _on_ButtonD_button_down():
	right = true

func _on_ButtonD_button_up():
	right = false
	
