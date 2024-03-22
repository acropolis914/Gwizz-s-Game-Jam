extends Node2D

@export var enemy1 : PackedScene
@export var enemy2 : PackedScene
@export var trap : PackedScene
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	if GlobalScript.trap:
		var traps = trap.instantiate()
		traps.position = Vector2(335, -40)
		add_child(traps)
	
	if GlobalScript.emeny_1:
		var traps = enemy1.instantiate()
		traps.position = Vector2(-253, 50)
		add_child(traps)


func _process(_delta):
	# Simple camera pan lang try
	#if $Player && $Player.velocity != Vector2.ZERO:
	#	$Camera2D.position += ($Player.position - $Camera2D.position)/3 * delta

	if $Debug/CheckButton.button_pressed:
		$"enemy_type_1".change_art()


func _on_spawn_enemy_2_pressed():
	var enemy2_instance = enemy2.instantiate()
	enemy2_instance.position = Vector2(randi_range(0,screen_size.x),randi_range(0,screen_size.y))
	add_child(enemy2_instance)
