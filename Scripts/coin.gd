extends Area2D

func _ready():
	if !GlobalScript.coins:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		GlobalScript.coins += 1
		queue_free()
