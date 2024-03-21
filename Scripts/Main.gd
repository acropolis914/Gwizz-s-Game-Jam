extends Node2D

@export var enemy2 : PackedScene
var screen_size

func _ready():
	if GlobalScript.trap:
		var trap = preload("res://Scene/trap.tscn")
		var traps = trap.instantiate()
		traps.position = Vector2(335, -40)
		add_child(traps)
	if GlobalScript.emeny_1:
		var trap = preload("res://Scene/enemy_type_1.tscn")
		var traps = trap.instantiate()
		traps.position = Vector2(-253, 50)
		add_child(traps)


func _process(_delta):
	# Simple camera pan lang try
	#if $Player && $Player.velocity != Vector2.ZERO:
	#	$Camera2D.position += ($Player.position - $Camera2D.position)/3 * delta

	if $Debug/CheckButton.button_pressed:
		$"Enemy Type 1".change_art()


func _on_spawn_enemy_2_pressed():
	var enemy2_instance = enemy2.instantiate()
	enemy2_instance.position = Vector2(randi_range(0,screen_size.x),randi_range(0,screen_size.y))
	add_child(enemy2_instance)
