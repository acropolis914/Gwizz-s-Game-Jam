extends Area2D

var speed = 1
var toAttack = false
func _process(delta):
	var player_pos = get_parent().get_node("Player").get_position()
	if position.distance_to(player_pos) > 200:
		position += speed * (player_pos-position) * delta
	if toAttack:
		_attack()
		

func _on_attack_timer_timeout():
	toAttack = true

func _attack():
	var projectile = preload("res://Scene/projectile.tscn")
	var projectiles = projectile.instantiate()
	add_child(projectiles)
	toAttack = false
