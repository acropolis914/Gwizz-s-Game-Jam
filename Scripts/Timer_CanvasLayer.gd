extends CanvasLayer

@onready var game_timer = $Game_Timer
@onready var timer_label = $Timer_Label
@onready var coins_label = $Coins_Label


func _process(_delta):
	timer_label.text = "Timer: " + str(int(game_timer.time_left))
	coins_label.text = "Coins: " + str(GlobalScript.coins)
