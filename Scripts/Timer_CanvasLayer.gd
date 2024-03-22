extends CanvasLayer

@onready var game_timer = $Game_Timer
@onready var label = $Label

func _process(delta):
	label.text = "Timer: " + str(int(game_timer.time_left))
