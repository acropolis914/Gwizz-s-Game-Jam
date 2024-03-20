extends Area2D

@onready var enemy_1_sprite = $Enemy_1_sprite
@onready var enemy_block_1 = $Enemy_block_1
@onready var player = get_parent().get_node("Player")


func _ready():
	enemy_1_sprite.hide()

func _on_area_entered(_area):
	queue_free()

func change_art():
	enemy_block_1.hide()
	enemy_1_sprite.show()

func _process(delta):
	global_position = player.get_position()

func _follow_player():
	
