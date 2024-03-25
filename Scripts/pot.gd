extends Area2D
@onready var smack_sfx = $Smack_sfx
@onready var stat_colli = $staticbody/CollisionShape2D

func _ready():
	stat_colli.disabled = true
	if !GlobalScript.pots:
		queue_free()
	stat_colli.disabled = false

func _on_area_entered(area):
	if area.is_in_group("player_attack"):
		$Art_Sprite.texture = preload("res://ImageAssets/Pot_broken.png")
		print('break')
		if has_node("staticbody"):
			smack_sfx.play()
			$staticbody.queue_free()

func _process(delta):
	var player = get_parent().get_parent().get_node("Player")
	if player.global_position.y > global_position.y:
		z_index = 0
	else:
		z_index = 2
