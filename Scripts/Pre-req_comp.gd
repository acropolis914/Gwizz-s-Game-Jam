extends Node2D
@onready var trap = $"../Panel/Trap"
@onready var skip = $"../Panel/Skip"

func _process(delta: float) -> void:
	if GlobalScript.dash:
		print("dash added")
		trap.show()
		$"../Panel".position = Vector2(239, 110)
	if GlobalScript.story:
		skip.show()
		$"../Panel".position = Vector2(239, 110)
