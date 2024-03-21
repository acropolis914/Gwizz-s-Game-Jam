extends Area2D

@onready var trap_anim = $AnimationPlayer

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.kill()


func _on_x_area_2d_body_entered(_body):
	trap_anim.play("trap")