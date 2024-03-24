extends CharacterBody2D

@onready var enemy_1_sprite = $Enemy_1_sprite
@onready var enemy_block_1 = $Enemy_block_1
@onready var player = get_parent().get_node("Player")
var speed = .4

func _ready():
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
