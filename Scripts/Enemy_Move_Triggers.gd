extends Node2D

func _on_room_2_trigger_area_2d_body_entered(body):
	if body is Player:
		GlobalScript.in_room2 = true

func _on_room_3_trigger_area_2d_body_entered(body):
	if body is Player:
		GlobalScript.in_room3 = true
