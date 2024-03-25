extends Node2D

@onready var main = $Main
@onready var option = $Option


func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://Scene/main.tscn")

func _on_options_button_button_down():
	option.show()

func _process(delta):
	if option.is_visible():
		main.hide()
	else:
		main.show()
