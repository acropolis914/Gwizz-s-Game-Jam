extends Node

func _on_enemy_type_1_area_entered(area):
	$"..".queue_free()
