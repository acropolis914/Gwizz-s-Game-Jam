extends Node

func _on_enemy_type_1_area_entered(_area):
	$"..".queue_free()
