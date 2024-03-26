extends CanvasLayer

var background_sprite = {
	0 : preload("res://ImageAssets/BG Computer Day 0.png"),
	1 : preload("res://ImageAssets/BG Gwizz Jam Site.png"),
	2 : preload("res://ImageAssets/BG Godot UI.png"),
	3 : preload("res://ImageAssets/BG Computer Day 0.png"),
	4 : preload("res://ImageAssets/BG Computer Day 1.png"),
	5 : preload("res://ImageAssets/BG Computer Day 2.png"),
	6 : preload("res://ImageAssets/BG Computer Day 3.png"),
	7 : preload("res://ImageAssets/BG Computer Day 4.png"),
	8 : preload("res://ImageAssets/BG Computer Day 5.png"),
	9 : preload("res://ImageAssets/BG Computer Day 6.png"),
	10 : preload("res://ImageAssets/BG Computer Day 7.png"),
	11 : preload("res://ImageAssets/BG Computer Day 8.png")
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
	#for Level7
	9 : "Gotta add more stuff!",
	#for Level8
	10 : "Gotta add more stuff!",
	11 : "",

	#for coding
	19 : "CHOOSE",
	20 : "KEY SMASH!!!",
	21 : "PLAY TEST IT!"
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
adding music and sfx
func _ready():
   good_music.play()

func _misuc():
   if player dash:
   then dash.play()

func _kidnap_musician():
   notes is hitting:
   autoplay_good_music
",
	5 :
"
Learning Gwizz
We be Gwizzing
Gwizz
Zzzzzzzzz Bee :3
",
	6 :
"
func _input(event):
   if event == lit:
   on_fire = true

func _process(_delta):
   if on_fire == true:
   dancing_queen = true
   power += 9000*delta
   depression = false
",
	7 :
"
var procratination = 10
var 
",
	8 :
"
func finishing_game(happiness):
   godot.open()
   code.write()
   play_test.test()
   game.submit(happiness)

func rating():
   if game == bad:
   YUCK
   elif game == good:
   NICE
"
}
@onready var next_button = $Next_Button
@onready var play_button = $Play_Button

@onready var dialog_label = $Dialog_Label
@onready var coding_label = $Coding_Label

@onready var BG_Sprite = $Background_Sprite2D

var dialog_num = 3
var code_num = 0
var bg_number = 0

#for level and num
var dialog_num_level = {1: 3, 2: 4, 3: 5,4: 6,5: 7, 6: 8, 7: 9, 8: 10}
var bg_num_level = {1: 4, 2: 5, 3: 6, 4: 7, 5: 8, 6: 9, 7: 10, 8: 11}

func _ready():
	coding_label.visible_ratio = 0
	play_button.hide()
	if GlobalScript.level != 0:
		dialog_num = dialog_num_level[GlobalScript.level]
		code_num = GlobalScript.level
		bg_number = bg_num_level[GlobalScript.level]

func _process(_delta):
	dialog_label.text = dialog_text[dialog_num]
	coding_label.text = code_text[code_num]
	BG_Sprite.texture = background_sprite[bg_number]
	
	if coding_label.visible_ratio == 1:
		coding_done()

func coding_done():
	play_button.show()
	dialog_num = 21

func _on_next_button_button_up():
	dialog_num += 1
	if dialog_num == 1:
		bg_number = 1
	if dialog_num >= 3:
		next_button.hide()
		bg_number = 2
		
	if dialog_num == 3:
		dialog_num = 20
	if dialog_num in [4, 5, 6, 7, 8, 9, 10]:
		dialog_num = 19
		$Card_Button.show()
		$Error_Card_Button.show()

func _input(event):
	if event is InputEventKey && event.pressed:
		if dialog_num == 20:
			coding_label.visible_ratio += .07

var bad_end = false
@onready var fade = $Error/Fade

func _on_play_button_button_down():
	if bad_end:
		$Error.show()
		#PLAY GAME OVER SONG
	else:
		get_tree().change_scene_to_file("res://Scene/main.tscn")

func reset_game_stats():
	var var_false = ["emeny_1","emeny_2","emeny_3","trap_rock",
	"trap_slime","puzzle", "collectible","dash", "vissuals",
	"pots","story","skip", "key", "in_game", "in_room2", "in_room3"]
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
	$Error/Error_Button.hide()
	fade.play("Fade")
	await fade.animation_finished
	reset_game_stats()
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")

func _on_testing_button_button_down():
	print(GlobalScript.coins)



func _on_feature_chooser_ui_error() -> void:
	bad_end = true

func _on_feature_chooser_ui_chosen() -> void:
	dialog_num += 1

