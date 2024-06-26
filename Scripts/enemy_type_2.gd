extends Area2D

var speed_multiplier
var resting = false
@onready var art_sprite = $Art_Sprite
@onready var temp_sprite = $Temp_Sprite


func _ready():
	if !GlobalScript.emeny_2:
		queue_free()
	$run.start()
	art_sprite.animation = "flap"
	art_sprite.play()

func _process(delta):
	speed_multiplier = randf_range(0.75, 1.1)
	if resting:
		pass
	else: 
		if GlobalScript.in_room2 && GlobalScript.in_game:
			$Life.start()
			#pangit apaka basic na follow. seems stupid. let me get my cartesian plane
			var player_position = get_parent().get_node("Player").get_position()
			position += speed_multiplier * (player_position-position) * delta * sin(deg_to_rad(randi_range(0,90))) 
			position.y = position.y + 5* sin(deg_to_rad(randi_range(0,90))) * delta
			#not yet properly implemented. use above if desired
			#position += atan2((player_position.x -position.x),(player_position.y-position.y))

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.kill()

func _on_run_timeout():
	resting = true
	$rest.set_wait_time(randf_range(3,7))
	$rest.start()
	
func _on_rest_timeout():
	resting = false
	$run.set_wait_time(randf_range(3,7))
	$run.start()

func _on_life_timeout():
	$DeathBlood.emitting = true
	await get_tree().create_timer(0.6).timeout
	queue_free()
