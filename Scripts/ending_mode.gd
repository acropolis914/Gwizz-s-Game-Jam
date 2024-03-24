extends CanvasLayer

var bg_ending = {
	0 : preload("res://ImageAssets/BG Gwizz Jam Site.png"),
	1 : preload("res://ImageAssets/BG Ending 1.png"),
	2 : preload("res://ImageAssets/BG Ending 2.png"),
	3 : preload("res://ImageAssets/BG Ending 3.png")
}

@onready var fade_anim = $AnimationPlayer
var bg_num = 0

func _ready():
	$Black_Sprite2D.show()
	fade_anim.play("fade")

func _process(_delta):
	$Background.texture = bg_ending[bg_num]

func _on_submit_button_button_down():
	$Submit_Button.hide()
	fade_anim.play("fade_to_black")
	await fade_anim.animation_finished
	if GlobalScript.aesthetic >= 7:
		bg_num = 1
	elif GlobalScript.aesthetic <= 2:
		bg_num = 2
	else:
		bg_num = 3
	fade_anim.play("fade")
	await fade_anim.animation_finished
	$End_Button.show()


func _on_end_button_button_down():
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
	
