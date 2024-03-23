extends CharacterBody2D

@export var speed = 300
@onready var killer_area = $"KillerArea/CollisionShape2D"
@onready var gwizz_sprite = $GwizzSprite


var dead = false

func _ready():
	killer_area.disabled = true
	gwizz_sprite.animation = "walk"
	

func for_movement(_delta):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if velocity.x != 0:
		gwizz_sprite.flip_v = false
		gwizz_sprite.flip_h = velocity.x < 0
	if velocity == Vector2.ZERO:
		gwizz_sprite.animation = "idle"
	#position = position.clamp(Vector2.ZERO,get_parent().screen_size)
var mouse_pos
func for_mouse_movement(delta):
	mouse_pos = get_global_mouse_position()
	if position.distance_to(mouse_pos) > 30:
		velocity = speed * (mouse_pos-global_position).normalized()
	else:
		velocity = Vector2.ZERO

func for_dash_and_kill():
	var mouse_dis = position.distance_to(get_global_mouse_position())
	if Input.is_action_just_pressed("dash") && velocity.x != 0:
			speed = 1800
			gwizz_sprite.animation = "dash"
			$DashParticle.emitting = true
			killer_area.disabled = false
			await get_tree().create_timer(0.1).timeout
			#var tween = create_tween()
			#tween.tween_property(gwizz_sprite, "animation", "walk" , .5)
			gwizz_sprite.animation = "walk"
			speed= 300
			killer_area.disabled = true
		

func _physics_process(delta):
	if dead || GlobalScript.isCoding:
		return
	if GlobalScript.mouse_mode:
		for_mouse_movement(delta)
	else:
		for_movement(delta)
	if GlobalScript.dash:
		for_dash_and_kill()
	move_and_slide()
	gwizz_sprite.play()

func kill():
	if dead:
		return
	print("player killed")
	position = position
	var tween = get_tree().create_tween()
	tween.tween_property(gwizz_sprite, "modulate", Color.RED, .2).set_trans(Tween.TRANS_SINE)
	tween.tween_property(gwizz_sprite, "scale", Vector2(), .2).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_callback(gwizz_sprite.queue_free)
	dead = true
	await get_tree().create_timer(1.0).timeout
	dead = false
	get_tree().reload_current_scene()

func has_key():
	$Key_Sprite2D.show()

func gate_unlocked():
	$Key_Sprite2D.hide()

func _on_game_timer_timeout():
	kill()
