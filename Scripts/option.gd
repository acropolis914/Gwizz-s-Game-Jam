extends CanvasLayer

var ending_bg = {
	1: preload("res://ImageAssets/BG Ending 1.png"),
	2: preload("res://ImageAssets/BG Ending 2.png"),
	3: preload("res://ImageAssets/BG Ending 3.png"),
	4: preload("res://ImageAssets/BG Ending 4 with BG.png")
}

var daily_bg = {
	0: preload("res://ImageAssets/BG Computer Day 0.png"),
	1: preload("res://ImageAssets/BG Computer Day 1.png"),
	2: preload("res://ImageAssets/BG Computer Day 2.png"),
	3: preload("res://ImageAssets/BG Computer Day 3.png"),
	4: preload("res://ImageAssets/BG Computer Day 4.png"),
	5: preload("res://ImageAssets/BG Computer Day 5.png"),
	6: preload("res://ImageAssets/BG Computer Day 6.png"),
	7: preload("res://ImageAssets/BG Computer Day 7.png"),
	8: preload("res://ImageAssets/BG Computer Day 8.png")
}


@onready var endings_sprite = $Endings_sprite

func _process(delta):
	if GlobalScript.vissuals:
		$Toggles/Art_Mode.show()
	if Input.is_action_just_pressed("pause"):
		if !is_visible():
			show()
			GlobalScript.in_game = false
		else:
			_on_x_button_button_down()

	if GlobalScript.ending_1 ||GlobalScript.ending_2 ||GlobalScript.ending_3 ||GlobalScript.ending_4:
		$Backgrounds/BgArrowR.show()
		$Backgrounds/BgArrowL.show()
	show_endings()
	toggles()

func show_endings():
	for i in range(1, 5):
		if GlobalScript.get("ending_" + str(i)):
			get_node("Endings/Ending" + str(i)).show()


func toggles():
	if GlobalScript.mouse_mode:
		$Toggles/Mouse_Mode.button_pressed = true
	else :
		$Toggles/Mouse_Mode.button_pressed = false
	
	if GlobalScript.camera_mode:
		$Toggles/Camera_Mode.button_pressed = true
	else:
		$Toggles/Camera_Mode.button_pressed = false


func _on_x_button_button_down():
	hide()
	if !get_parent().has_node("Story_in_Game"):
		await get_tree().create_timer(.2).timeout
		GlobalScript.in_game = true

func _on_mouse_mode_toggled(toggled_on):
	GlobalScript.mouse_mode = toggled_on

func _on_camera_mode_toggled(toggled_on):
	GlobalScript.camera_mode = toggled_on

func _on_art_mode_toggled(toggled_on):
	GlobalScript.vissuals = toggled_on
	print(GlobalScript.vissuals)

func _on_button_button_down(i):
	endings_sprite.show()
	endings_sprite.texture = ending_bg[i]

func _on_end_close_button_button_down():
	endings_sprite.hide()

var bg_num = 0

func _on_arrow_button_down(i):
	bg_num += 1
	$Backgrounds/DailyBackground.texture = daily_bg[bg_num%8]
