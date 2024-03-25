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

func _process(delta):
	camera_mode(delta)
	if has_node("Story_in_Game"):
		if $Option.is_visible():
			$Story_in_Game.hide()
		else:
			$Story_in_Game.show()

func camera_mode(delta):
	if !GlobalScript.camera_mode:
		if $Player.speed <= 300:
			$Camera2D.position += ($Player.position - $Camera2D.position)/1.5 * delta
		else:
			$Camera2D.position += ($Player.position - $Camera2D.position)/1 * delta
	else:
		$Camera2D.position = $Player.position
