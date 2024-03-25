extends Area2D

func _ready():
	if !GlobalScript.pots:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("player_attack"):
		$Sprite2D.texture = preload("res://ImageAssets/White.png")
		print('break')
		if has_node("staticbody"):
			$staticbody.queue_free()
