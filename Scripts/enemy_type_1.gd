extends Area2D

@onready var enemy_1_sprite = $Enemy_1_sprite
@onready var enemy_block_1 = $Enemy_block_1
@onready var player = get_parent().get_node("Player")

func _ready():
	enemy_1_sprite.hide()

func change_art():
	enemy_block_1.hide()
	enemy_1_sprite.show()


func _follow_player():
	pass

func _on_body_entered(body):
	body.kill()

