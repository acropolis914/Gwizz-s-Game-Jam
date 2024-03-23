extends Area2D

@onready var trap_anim = $AnimationPlayer

#Area of main body
func _on_body_entered(body):
	if body is Player:
		body.kill()

#Area of below body X marks the spot
func _on_x_area_2d_body_entered(body):
	if body is Player:
		trap_anim.play("trap")
