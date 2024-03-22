extends Area2D

var speed_multiplier
var resting = false

func _ready():
	$run.start()
	$Life.start()
	$AnimatedSprite2D.animation = "flap"
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed_multiplier = randf_range(0.75, 1.1)
	if resting:
		pass
	else: 
		#pangit apaka basic na follow. seems stupid. let me get my cartesian plane
		var player_position = get_parent().get_node("Player").get_position()
		position += speed_multiplier * (player_position-position) * delta * sin(deg_to_rad(randi_range(0,90))) 
		position.y = position.y + 5* sin(deg_to_rad(randi_range(0,90))) * delta
		#not yet properly implemented. use above if desired
		#position += atan2((player_position.x -position.x),(player_position.y-position.y))

func _on_body_entered(body):
	if body.has_method("kill"):
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
