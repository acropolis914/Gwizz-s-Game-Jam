extends Area2D

func _ready():
	if !GlobalScript.trap_slime:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.slimed()

func _on_body_exited(body):
	if body.is_in_group("player"):
		body.unslimed()
