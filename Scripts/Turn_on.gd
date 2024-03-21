extends Node2D


func _on_trap_button_button_down():
	GlobalScript.trap = true
	$Trap_Button.hide()

func _on_enemy_1_button_button_down():
	GlobalScript.emeny_1 = true
	$Enemy_1_Button.hide()

func _on_enemy_2_button_2_button_down():
	GlobalScript.emeny_2 = true
	$Enemy_2_Button2.hide()
