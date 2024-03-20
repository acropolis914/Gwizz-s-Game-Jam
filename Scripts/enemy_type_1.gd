extends Area2D

func _ready():
	$AnimatedSprite2D.hide()

func _on_area_entered(area):
	area.kill()
	
func change_art():
	$Sprite2D.hide()
	$AnimatedSprite2D.show()
