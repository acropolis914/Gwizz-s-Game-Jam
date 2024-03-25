extends Area2D

var inPot = false

func _ready():
	if !GlobalScript.puzzle:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("pot"):
		inPot = true
	if body.is_in_group("player") && !inPot:
		GlobalScript.key = true
		queue_free()
		body.has_key()

func _on_body_exited(body):
	await get_tree().create_timer(.8).timeout
	inPot = false
