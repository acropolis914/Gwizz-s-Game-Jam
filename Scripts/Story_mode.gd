extends CanvasLayer

var background_sprite = {
	0 : preload("res://ImageAssets/Screenshot Computer.png"),
	1 : preload("res://ImageAssets/Screenshot Gwizz.png"),
	2 : preload("res://ImageAssets/Screenshot Godot.png")
}

var dialog_text = {
	#for Level0
	0 : "I wanna make a game.",
	1 : "A gwizz jam? This looks.. fun. Alright, let's do it!",
	2 : "I'll make an RPG. How hard could it be?",

	#for Level1
	3 : "Hmm... too easy. Let's add more features.",
	#for Level2
	4 : "Boring! I could add that thing.",
	#for Level3
	5 : "Zzz... More features!",
	#for Level4
	6 : "Oh I have this another idea.",
	#for Level5
	7 : "My game is aweful... I should add more.",
	#for Level6
	8 : "Gotta add more stuff!",

	#for coding
	9 : "CHOOSE",
	10 : "KEY SMASH!!!",
	11 : "PLAY TEST IT!",
}

var code_text = {
	0 : 
"
IF code game:
   then game is made
ELSE:
  game crash and I cry
",
	1 :
"
Make game little harder
LOOP then something:
   level += 1
func _add_feature():
   game is now baby level
",
	2 :
"
var rose
var violets
var game_devs

IF roses == red && violets == blue:
   THEN game_devs == you",
	3 : 
"
func _ready():
   stress = 0

func _process(_delta):
   stress += 10000 * days_making_game

IF stress >= 10000000000000:
   game_dev = self_doubts
",
	4 :
"
???
"
}
@onready var next_button = $Next_Button
@onready var play_button = $Play_Button

@onready var dialog_label = $Dialog_Label
@onready var coding_label = $Coding_Label

@onready var BG_Sprite = $Background_Sprite2D

var dialog_num = 0
var code_num = 0
var bg_number = 0

#for level and num
var dialog_num_level = {1: 3, 2: 4, 3: 5}
var code_num_level = {1: 1, 2: 2, 3: 3}

func _ready():
	coding_label.visible_ratio = 0
	play_button.hide()
	if GlobalScript.level != 0:
		dialog_num = dialog_num_level[GlobalScript.level]
		code_num = code_num_level[GlobalScript.level]

func _process(_delta):
	dialog_label.text = dialog_text[dialog_num]
	coding_label.text = code_text[code_num]
	BG_Sprite.texture = background_sprite[bg_number]
	
	if coding_label.visible_ratio == 1:
		coding_done()

func coding_done():
	play_button.show()
	dialog_num = 11


func _on_next_button_button_up():
	dialog_num += 1
	if dialog_num == 1:
		bg_number = 1
	if dialog_num >= 3:
		next_button.hide()
		bg_number = 2
		
	if dialog_num == 3:
		dialog_num = 10
	if dialog_num in [4, 5, 6, 7, 8]:
		dialog_num = 9
		$Card_Button.show()
		$Error_Card_Button.show()

func _input(event):
	if event is InputEventKey && event.pressed:
		if dialog_num == 10:
			coding_label.visible_ratio += .05

var bad_end = false
@onready var fade = $Error/Fade

func _on_play_button_button_down():
	if bad_end:
		$Error.show()
		#PLAY GAME OVER SONG
	else:
		get_tree().change_scene_to_file("res://Scene/main.tscn")

func reset_game_stats():
	var var_false = ["emeny_1", "emeny_2", "emeny_3", "trap", "dash", "key"]
	for vars in var_false:
		GlobalScript[vars] = false
	var var_zero = ["level", "aesthetic", "coins"]
	for vars_z in var_zero:
		GlobalScript[vars_z] = 0

#Below are temporary for the cards
func _on_card_button_button_down():
	dialog_num += 1
	$Card_Button.hide()
	$Error_Card_Button.hide()
	
func _on_error_card_button_button_down():
	bad_end = true

func _on_error_button_button_down():
	$Error/Button.hide()
	fade.play("Fade")
	await fade.animation_finished
	reset_game_stats()
	get_tree().reload_current_scene()

func _on_testing_button_button_down():
	print(GlobalScript.coins)
