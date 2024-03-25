extends Node2D

func _process(_delta):
	if GlobalScript.vissuals && $"../Temp_Sprite".is_visible():
		change_art_on()
	if !GlobalScript.vissuals && !$"../Temp_Sprite".is_visible():
		change_art_off()

func change_art_on():
	$"../Temp_Sprite".hide()
	$"../Art_Sprite".show()

func change_art_off():
	$"../Temp_Sprite".show()
	$"../Art_Sprite".hide()
