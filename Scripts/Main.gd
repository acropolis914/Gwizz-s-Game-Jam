extends Node2D

@export var enemy1 : PackedScene
@export var enemy2 : PackedScene
@export var trap : PackedScene
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	if GlobalScript.trap_rock:
		var traps = trap.instantiate()
		traps.position = $trap_position.position
		add_child(traps)
	
	if GlobalScript.enemy_1:
		var enemy1 = enemy1.instantiate()
		enemy1.position = Vector2(-253, 50)
		add_child(enemy1)


func _process(delta):
	#Simple camera pan lang try
	if $Player:
		if $Player.speed <= 300:
			$Camera2D.position += ($Player.position - $Camera2D.position)/1.5 * delta
		else:
			$Camera2D.position += ($Player.position - $Camera2D.position)*delta

	if $Debug/CheckButton.button_pressed:
		$"enemy_type_1".change_art()


func _on_spawn_enemy_2_pressed():
	var enemy2_instance = enemy2.instantiate()
	enemy2_instance.position = Vector2(randi_range(0,screen_size.x),randi_range(0,screen_size.y))
	add_child(enemy2_instance)
