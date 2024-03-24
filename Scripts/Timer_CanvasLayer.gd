extends CanvasLayer

@onready var coins_label = $Coins_Label
@onready var level_label = $Level_Label


func _process(_delta):
	coins_label.text = "Coins: " + str(GlobalScript.coins)
	level_label.text = "Level: " +str(GlobalScript.level)
