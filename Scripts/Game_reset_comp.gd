extends Node2D

func reset_game_stats():
	var var_false = ["emeny_1","emeny_2","emeny_3","trap_rock",	"trap_slime","puzzle", 
	"collectible","dash", "vissuals","pots","story","skip", 
	"key", "in_game", "in_room2", "in_room3"]
	for vars in var_false:
		GlobalScript[vars] = false
	var var_zero = ["level", "aesthetic", "coins"]
	for vars_z in var_zero:
		GlobalScript[vars_z] = 0
