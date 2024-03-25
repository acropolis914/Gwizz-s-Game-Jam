extends Area2D
@onready var slime_sfx = $Slime_sfx

func _ready():
	if !GlobalScript.trap_rock:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		slime_sfx.play()
		body.slimed()

func _on_body_exited(body):
	if body.is_in_group("player"):
		body.unslimed()
