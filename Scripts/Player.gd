extends CharacterBody2D

@export var speed = 300
@onready var killer_area = $"Killer Area/CollisionShape2D"
var dead = false


func _ready():
	killer_area.disabled = true
	$AnimatedSprite2D.animation = "walk"

func for_movement():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
	if velocity.x != 0:
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.animation = "idle"
		
func for_dash_and_kill():
	if Input.is_action_just_pressed("dash") && velocity.x != 0:
		$AnimatedSprite2D.animation = "dash"
		$DashParticle.emitting = true
		speed = 1400
		killer_area.disabled = false
		$CollisionShape2D.disabled=true
		await get_tree().create_timer(0.1).timeout
		#var tween = create_tween()
		#tween.tween_property($AnimatedSprite2D, "animation", "walk" , .5)
		$AnimatedSprite2D.animation = "walk"
		speed= 300
		killer_area.disabled = true
		$CollisionShape2D.disabled=false
		

func _physics_process(_delta):
	if dead:
		return
	for_movement()
	for_dash_and_kill()
	move_and_slide()
	$AnimatedSprite2D.play()
	
func _process(delta):
	pass

func kill():
	print("player killed")
	position = position
	var tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "modulate", Color.RED, .2).set_trans(Tween.TRANS_SINE)
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(), .2).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_callback($AnimatedSprite2D.queue_free)
	dead = true
