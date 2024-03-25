extends Node

func _on_killer_area_2d_area_entered(area):
	if area.is_in_group("player_attack"):
		var blood = preload("res://Scene/blood.tscn")
		var bloods = blood.instantiate()
		bloods.global_position = $"..".global_position
		$"..".add_sibling(bloods)
		$"..".queue_free()
