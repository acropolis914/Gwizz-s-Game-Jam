extends CharacterBody2D

@onready var enemy_1_sprite = $Art_Sprite
@onready var enemy_block_1 = $Temp_Sprite
@onready var player = get_parent().get_node("Player")
var speed = .4

func _ready():
	if !GlobalScript.emeny_1:
		queue_free()
	enemy_1_sprite.hide()

func change_art():
	enemy_block_1.hide()
	enemy_1_sprite.show()

func _process(delta):
	var player_pos = get_parent().get_node("Player").get_position()
	if GlobalScript.in_game:
		position += speed * (player_pos-position) * delta
	move_and_slide()

func _on_killer_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.kill()
