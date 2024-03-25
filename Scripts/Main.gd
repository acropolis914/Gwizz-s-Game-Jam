extends Node2D

@export var enemy1 : PackedScene
@export var enemy2 : PackedScene
@export var trap : PackedScene
var screen_size
@onready var fade = $Fade

func _ready():
	fade.play("fade")
	$Story_in_Game.show()
	screen_size = get_viewport_rect().size
	if GlobalScript.trap_rock:
		var traps = trap.instantiate()
		traps.position = $trap_position.position
		add_child(traps)

func _process(delta):
	#Simple camera pan lang try
	#if $Player:
	#	$Camera2D.position += ($Player.position - $Camera2D.position)/1 * delta

	if $Debug/CheckButton.button_pressed:
		$"enemy_type_1".change_art()


func _on_spawn_enemy_2_pressed():
	var enemy2_instance = enemy2.instantiate()
	enemy2_instance.position = Vector2(randi_range(0,screen_size.x),randi_range(0,screen_size.y))
	add_child(enemy2_instance)


func _on_vissual_button_button_down():
	GlobalScript.vissuals = true
