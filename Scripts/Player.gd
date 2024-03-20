extends CharacterBody2D

@export var speed = 300
@onready var killer_area = $"Killer Area/CollisionShape2D"

func _ready():
	killer_area.disabled = true
	$AnimatedSprite2D.animation = "walk"

func for_movement():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
	if velocity.x != 0:
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
func for_dash_and_kill():
	if Input.is_action_just_pressed("dash") && velocity.x != 0:
		$AnimatedSprite2D.animation = "dash"
		$AnimatedSprite2D.play()
		speed = 1400
		killer_area.disabled = false
		
		await get_tree().create_timer(0.1).timeout
		var tween = create_tween()
		#tween.tween_property($AnimatedSprite2D, "animation", "walk" , .5)
		$AnimatedSprite2D.animation = "walk"
		speed= 300
		killer_area.disabled = true 
	

func _physics_process(_delta):
	for_movement()
	for_dash_and_kill()
	move_and_slide()
	
func _process(delta):
	pass

func kill():
	hide()
