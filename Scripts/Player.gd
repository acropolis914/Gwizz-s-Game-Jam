extends CharacterBody2D

var velocity : int

func _process(delta):
	velocity =Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity += 1
