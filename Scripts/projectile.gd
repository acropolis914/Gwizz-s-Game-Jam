extends Area2D

var speed = 800
var player_pos
var dir

func _ready():
	player_pos = get_parent().get_parent().get_node("Player").get_position()
	dir = (player_pos-global_position).normalized()
	rotation = dir.angle()
	
func _process(delta):
	global_position += dir * delta * speed

func _on_body_entered(body):
	if body is Player:
		body.kill()
	if body is TileMap:
		queue_free()
