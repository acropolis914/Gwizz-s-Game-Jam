extends CharacterBody2D


var speed = 100
var toAttack = false
@onready var attack_timer = $Attack_Timer


func _ready() -> void:
	$AnimatedSprite2D.play()
	
func _process(delta):
	var player_pos = get_parent().get_node("Player").get_position()
	if GlobalScript.in_room3:
		if attack_timer.is_stopped():
			attack_timer.set_wait_time(randi_range(3,6))
			attack_timer.start()
		if position.distance_to(player_pos) > 200:
			position += speed * (player_pos-position).normalized() * delta
		if toAttack:
			_attack()
	move_and_slide()

func _on_attack_timer_timeout():
	toAttack = true

func _attack():
	var projectile = preload("res://Scene/projectile.tscn")
	var projectiles = projectile.instantiate()
	add_child(projectiles)
	toAttack = false
