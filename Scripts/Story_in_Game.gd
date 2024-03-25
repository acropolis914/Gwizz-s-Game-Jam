extends CanvasLayer

@onready var dialog_label = $dialog_Label
var dialogs = {
	0 : "Brave hero, I have a quest for you to go on. 
	Our village is in danger from an Evil Wizard who 
	has captured Princess Papaya.",
	1: "I need you to go 
	into his dungeon, find her, and bring them back 
	here safely. Do you believe you have what it takes",
	2: "to face this evil wizard and rescue the princess?
	You will face many dangers in this quest, and 
	it will be no easy task. But I have faith in you,",
	3: "I know you have what it takes to succeed.
	If you have any questions or concerns before you
	embark on this quest, feel free to ask now.",
	4: "And remember, you can always return here and ask 
	me for advice or guidance.",
	5: "Poor Papaya. She is a bright and witty young 
	girl, with a passion for helping others, particularly 
	animals. She loves to spend her time exploring the",
	6: "forest and feeding the birds, squirrels, and other 
	wildlife. She has a soft spot for all creatures.
	Would never harm a fellow living being. She was",
	7: "kidnapped by the evil wizard because he suspected 
	that she was hiding some special power that he wanted
	to possess for himself.",
	8: "No time to waste, young hero! On with your quest!"}

var dialog_num = 0

func _ready():
	GlobalScript.in_game = false
	GlobalScript.in_room2 = false
	GlobalScript.in_room3 = false
	$Next_Button.hide()
	dialog_label.visible_ratio = 0
	if GlobalScript.skip:
		$Skip_Button.show()
	else:
		$Skip_Button.hide()

func _process(_delta):
	dialog_label.text = dialogs[dialog_num]
	dialog_label.visible_ratio += .005
	if dialog_label.visible_ratio == 1:
		$Next_Button.show()

func _on_next_button_button_down():
	dialog_label.visible_ratio = 0
	$Next_Button.hide()
	if dialog_num == 8:
		GlobalScript.in_game = true
		queue_free()
	else:
		dialog_num += 1

func _on_skip_button_button_down():
	await get_tree().create_timer(.2).timeout
	GlobalScript.in_game = true
	queue_free()
