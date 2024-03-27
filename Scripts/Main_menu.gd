extends Node2D

@onready var main = $Main
@onready var option = $Option

func _ready():
	if GlobalScript.ending_1 && GlobalScript.ending_2 && GlobalScript.ending_3 && GlobalScript.ending_4:
		$Full_Game.show()

func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://Scene/story_mode.tscn")

func _on_options_button_button_down():
	option.show()

func _process(_delta):
	if option.is_visible():
		main.hide()
	else:
		main.show()


func _on_button_button_down():
	get_tree().change_scene_to_file("res://Scene/main_full.tscn")
	var var_false = ["emeny_1","emeny_2","emeny_3","trap_rock",	"trap_slime","puzzle", 
	"collectible","dash", "vissuals","pots","story","skip"]
	for vars in var_false:
		GlobalScript[vars] = true
	GlobalScript.coins = 0
	
