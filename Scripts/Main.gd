extends Node2D

func _ready():
	pass
	
func _process(_delta):
	# Simple camera pan lang try
	#if $Player && $Player.velocity != Vector2.ZERO:
	#	$Camera2D.position += ($Player.position - $Camera2D.position)/3 * delta

	if $CanvasLayer/CheckButton.button_pressed:
		$"Enemy Type 1".change_art()
	
