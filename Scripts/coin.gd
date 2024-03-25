extends Area2D
@onready var coin_sfx = $coin_sfx
var inPot = false

func _ready():
	if !GlobalScript.collectible:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("pot"):
		inPot = true
	if body.is_in_group("player") && !inPot:
		GlobalScript.coins += 1
		$Art_Sprite.hide()
		$Temp_Sprite.hide()
		coin_sfx.play()
		await coin_sfx.finished
		queue_free()

func _on_body_exited(body):
	await get_tree().create_timer(.8).timeout
	inPot = false
