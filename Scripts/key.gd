extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		GlobalScript.key = true
		queue_free()
		body.has_key()
