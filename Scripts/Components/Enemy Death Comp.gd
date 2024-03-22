extends Node

func _on_killer_area_2d_area_entered(area):
	if area.is_in_group("player_attack"):
		$"..".queue_free()
