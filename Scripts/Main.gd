extends Node2D

func _process(delta):
	$Camera2D.position += ($Player.position - $Camera2D.position)/12 * delta
