extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player") && GlobalScript.key:
		queue_free()
		body.gate_unlocked()
