extends Node2D

var sound_managers = []
export(Dictionary) var sounds = {}

func play_sound(sound_name):
	if sound_name in sounds:
		var sound = sounds[sound_name]
		var a = AudioStreamPlayer2D.new()
		a.stream = sound
		a.volume_db = -6
		add_child(a)
		a.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
