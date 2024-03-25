extends CPUParticles2D

@onready var blood_sfx = $Blood_sfx

func _ready():
	emitting = true
	blood_sfx.play()
	await blood_sfx.finished
