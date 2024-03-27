extends Area2D
@onready var canvas_layer = $CanvasLayer
@onready var fade_anim = $CanvasLayer/fade
@onready var giggle_sfx = $Giggle_sfx

func _ready():
	canvas_layer.hide()

func _on_body_entered(body):
	if body.is_in_group("player"):
		giggle_sfx.play()
		print(GlobalScript.level)
		canvas_layer.show()

func _on_button_down():
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
	reset_game_stats()


func reset_game_stats():
	var var_false = ["emeny_1","emeny_2","emeny_3","trap_rock",	"trap_slime","puzzle", 
	"collectible","dash", "vissuals","pots","story","skip", 
	"key", "in_game", "in_room2", "in_room3"]
	for vars in var_false:
		GlobalScript[vars] = false
	var var_zero = ["level", "aesthetic", "coins"]
	for vars_z in var_zero:
		GlobalScript[vars_z] = 0
