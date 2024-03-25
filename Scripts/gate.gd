extends Area2D


func _ready():
	if !GlobalScript.puzzle:
		queue_free()
		
func _on_body_entered(body):
	if body.is_in_group("player") && GlobalScript.key:
		body.gate_unlocked()
		await get_tree().create_timer(1.0).timeout
		queue_free()
