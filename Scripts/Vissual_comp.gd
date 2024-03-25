extends Node2D



func _process(delta):
	if GlobalScript.vissuals:
		change_art()
		
func change_art():
	$"../Temp_Sprite".hide()
	$"../Art_Sprite".show()
