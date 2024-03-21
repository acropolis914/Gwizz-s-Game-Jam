extends Area2D
@onready var canvas_layer = $CanvasLayer

func _ready():
	canvas_layer.hide()

func _on_body_entered(body):
	canvas_layer.show()


func _on_button_button_down():
	GlobalScript.isCoding = true
	GlobalScript.level += 1
	get_tree().change_scene_to_file("res://Scene/story_mode.tscn")
