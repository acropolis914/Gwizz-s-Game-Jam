extends CanvasLayer

@onready var ending_1 = $Endings/Ending1_Sprite2D
@onready var ending_2 = $Endings/Ending2_Sprite2D
@onready var ending_3 = $Endings/Ending3_Sprite2D

func _on_submit_button_button_down():
	if GlobalScript.aesthetic >= 4:
		pass
		ending_1.show()
	if GlobalScript.aesthetic == 1:
		pass
		ending_2.show()
	else:
		pass
		ending_3.show()
