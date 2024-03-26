extends Control

var dash_enabled: bool= false
func _process(_delta: float) -> void:
	if GlobalScript.emeny_1:
		$Panel/Enemy_1/Label.text = "[center][color=gray][s]" + $Panel/Enemy_1/Label.text
		$Panel/Enemy_1.modulate = Color.LIGHT_GRAY
		$Panel/Enemy_1/Added.show()


func _on_enemy_1_gui_input(_event:InputEvent):
	if GlobalScript.emeny_1:
		return
	$Panel/Enemy_1.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.emeny_1 = true
		print($Panel/Enemy_1/Label.text)

func _on_enemy_1_mouse_exited() -> void:
	$Panel/Enemy_1.modulate = Color.WHITE
