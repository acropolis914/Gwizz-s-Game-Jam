extends Area2D
@onready var canvas_layer = $CanvasLayer
@onready var fade_anim = $CanvasLayer/fade
@onready var giggle_sfx = $Giggle_sfx

func _ready():
	canvas_layer.hide()

func _on_body_entered(body):
	if body.is_in_group("player"):
		giggle_sfx.play()
		GlobalScript.in_game = false
		print(GlobalScript.level)
		canvas_layer.show()

func _on_button_down():
	if GlobalScript.level == 8:
		end()
	else:
		GlobalScript.level += 1
		get_tree().change_scene_to_file("res://Scene/story_mode.tscn")
	
func end():
	canvas_layer.show()
	fade_anim.play("face")
	await fade_anim.animation_finished
	get_tree().change_scene_to_file("res://Scene/ending_mode.tscn")

