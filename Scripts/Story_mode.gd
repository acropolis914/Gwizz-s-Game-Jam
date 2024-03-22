extends CanvasLayer

var background_sprite = {
	0 : preload("res://ImageAssets/Screenshot Computer.png"),
	1 : preload("res://ImageAssets/Screenshot Gwizz.png"),
	2 : preload("res://ImageAssets/Screenshot Godot.png")
}

var dialog_text = {
	#for Level1
	0 : "I wanna make a game.",
	1 : "A gwizz jam? This looks.. fun. Alright, let's do it!",
	
	2 : "KEY SMASH!!!",
	3 : "PLAY TEST IT!",
	
	4 : "Hmm... too easy. Let's add more features.",
	5 : "CHOOSE",
	6 : "test1"
}

var code_text = {
	0 : "IF code game:
  then game is made
		ELSE:
  game crash and I cry",
	1 :
	"Make game little harder
	LOOP then something:
		level += 1
	func _add_feature():
		game is now baby level",
}
@onready var next_button = $Next_Button
@onready var play_button = $Play_Button

@onready var dialog_label = $Dialog_Label
@onready var coding_label = $Coding_Label
@onready var BG_Sprite = $Background_Sprite2D
var dialog_num = 0
var code_num = 0
var bg_number = 0

func _ready():
	hide()
	coding_label.visible_ratio = 0
	play_button.hide()

func _process(_delta):
	if GlobalScript.isCoding == true:
		show()
	
	dialog_label.text = dialog_text[dialog_num]
	coding_label.text = code_text[code_num]
	BG_Sprite.texture = background_sprite[bg_number]
	
	if coding_label.visible_ratio == 1:
		play_button.show()
		dialog_num = 3


func _on_next_button_button_up():
	dialog_num += 1
	if dialog_num == 1:
		bg_number = 1
	if dialog_num == 2:
		bg_number = 2
		next_button.hide()

func _input(event):
	if event is InputEventKey && event.pressed:
		if dialog_num == 2:
			coding_label.visible_ratio += .05

func _on_play_button_button_down():
	hide()
	GlobalScript.isCoding = false
	get_tree().change_scene_to_file("res://Scene/main.tscn")

func _on_skip_button_button_down():
	GlobalScript.isCoding = false
	get_tree().change_scene_to_file("res://Scene/main.tscn")
