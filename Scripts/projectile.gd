extends Area2D

var speed = 1000
var player_pos
var dir

func _ready():
	player_pos = get_parent().get_parent().get_node("Player").get_position()
	dir = (player_pos-global_position).normalized()
	
func _process(delta):
	global_position += dir * delta * speed

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.kill()
