extends Node2D



func _process(_delta):
	if GlobalScript.vissuals && $"../Temp_Sprite".is_visible():
		change_art()
		
func change_art():
	$"../Temp_Sprite".hide()
	$"../Art_Sprite".show()
