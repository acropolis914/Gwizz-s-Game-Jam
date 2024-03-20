extends CharacterBody2D

@export var speed = 300
@onready var killer_area = $"Killer Area/CollisionShape2D"

func _ready():
	killer_area.disabled = true

func for_movement():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
	#if velocity.x < 0:
		#$AnimatedSprite2D.flipvs
		
func for_dash_and_kill():
	if Input.is_action_just_pressed("dash"):
		speed = 1400
		killer_area.disabled = false
		await get_tree().create_timer(0.1).timeout
		speed = 300
		killer_area.disabled = true 

func _physics_process(_delta):
	for_movement()
	for_dash_and_kill()
	move_and_slide()
	
func _process(delta):
	$AnimatedSprite2D.animation = "walk"
	$AnimatedSprite2D.play()
