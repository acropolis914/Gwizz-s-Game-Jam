extends CharacterBody2D

@export var speed = 300

func for_movement():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

func for_dash():
	if Input.is_action_just_pressed("dash"):
		speed = 1400
		await get_tree().create_timer(0.1).timeout
		speed = 300

func _physics_process(delta):
	for_movement()
	for_dash()
	move_and_slide()
