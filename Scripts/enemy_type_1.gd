extends Area2D

func _ready():
	$AnimatedSprite2D.hide()

func _on_area_entered(area):
	queue_free()
	
func change_art():
	$Sprite2D.hide()
	$AnimatedSprite2D.show()
