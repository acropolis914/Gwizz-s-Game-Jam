extends Control
signal chosen
signal error

var dash_enabled: bool= false
func _process(_delta: float) -> void:
	if GlobalScript.emeny_1:
		$Panel/Enemy_1/Label.text = "[center][color=gray][s]" + $Panel/Enemy_1/Label.text
		$Panel/Enemy_1.modulate = Color.LIGHT_GRAY
		$Panel/Enemy_1/Added.show()
	if GlobalScript.emeny_2:
		$Panel/Enemy_2/Label.text = "[center][color=gray][s]" + $Panel/Enemy_2/Label.text
		$Panel/Enemy_2.modulate = Color.LIGHT_GRAY
		$Panel/Enemy_2/Added.show()
	if GlobalScript.emeny_3:
		$Panel/Enemy_3/Label.text = "[center][color=gray][s]" + $Panel/Enemy_3/Label.text
		$Panel/Enemy_3.modulate = Color.LIGHT_GRAY
		$Panel/Enemy_3/Added.show()
	if GlobalScript.trap_slime:
		$Panel/Slime/Label.text = "[center][color=gray][s]" + $Panel/Slime/Label.text
		$Panel/Slime.modulate = Color.LIGHT_GRAY
		$Panel/Slime/Added.show()
	if GlobalScript.puzzle:
		$Panel/Puzzle/Label.text = "[center][color=gray][s]" + $Panel/Puzzle/Label.text
		$Panel/Puzzle.modulate = Color.LIGHT_GRAY
		$Panel/Puzzle/Added.show()
	if GlobalScript.trap_rock:
		$Panel/Trap/Label.text = "[center][color=gray][s]" + $Panel/Trap/Label.text
		$Panel/Trap.modulate = Color.LIGHT_GRAY
		$Panel/Trap/Added.show()
	if GlobalScript.pots:
		$Panel/Pots/Label.text = "[center][color=gray][s]" + $Panel/Pots/Label.text
		$Panel/Pots.modulate = Color.LIGHT_GRAY
		$Panel/Pots/Added.show()
	if GlobalScript.vissuals:
		$Panel/Visuals/Label.text = "[center][color=gray][s]" + $Panel/Visuals/Label.text
		$Panel/Visuals.modulate = Color.LIGHT_GRAY
		$Panel/Visuals/Added.show()
	if GlobalScript.collectible:
		$Panel/Coins/Label.text = "[center][color=gray][s]" + $Panel/Coins/Label.text
		$Panel/Coins.modulate = Color.LIGHT_GRAY
		$Panel/Coins/Added.show()
	if GlobalScript.dash:
		$Panel/Dash/Label.text = "[center][color=gray][s]" + $Panel/Dash/Label.text
		$Panel/Dash.modulate = Color.LIGHT_GRAY
		$Panel/Dash/Added.show()
	if GlobalScript.story:
		$Panel/Story/Label.text = "[center][color=gray][s]" + $Panel/Story/Label.text
		$Panel/Story.modulate = Color.LIGHT_GRAY
		$Panel/Story/Added.show()
	if GlobalScript.skip:
		$Panel/Skip/Label.text = "[center][color=gray][s]" + $Panel/Skip/Label.text
		$Panel/Skip.modulate = Color.LIGHT_GRAY
		$Panel/Skip/Added.show()

#enemy 1
func _on_enemy_1_gui_input(_event:InputEvent):
	if GlobalScript.emeny_1:
		return
	$Panel/Enemy_1.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.emeny_1 = true
		print($Panel/Enemy_1/Label.text)

func _on_enemy_1_mouse_exited() -> void:
	$Panel/Enemy_1.modulate = Color.WHITE

#enemy 2
func _on_enemy_2_gui_input(_event:InputEvent):
	if GlobalScript.emeny_2:
		return
	$Panel/Enemy_2.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.emeny_2 = true
		print($Panel/Enemy_2/Label.text)

func _on_enemy_2_mouse_exited() -> void:
	$Panel/Enemy_2.modulate = Color.WHITE
	
#enemy3
func _on_enemy_3_gui_input(_event:InputEvent):
	if GlobalScript.emeny_3:
		return
	$Panel/Enemy_3.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.emeny_3 = true

func _on_enemy_3_mouse_exited() -> void:
	$Panel/Enemy_3.modulate = Color.WHITE
	
#slime
func _on_slime_gui_input(event: InputEvent) -> void:
	if GlobalScript.trap_slime:
		return
	$Panel/Slime.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.trap_slime = true

func _on_slime_mouse_exited() -> void:
	$Panel/Slime.modulate = Color.WHITE
	
func _on_puzzle_gui_input(event: InputEvent) -> void:
	if GlobalScript.puzzle:
		return
	$Panel/Puzzle.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.puzzle = true

func _on_puzzle_mouse_exited() -> void:
	$Panel/Puzzle.modulate = Color.WHITE


func _on_pots_gui_input(event: InputEvent) -> void:
	if GlobalScript.pots:
		return
	$Panel/Pots.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.pots = true


func _on_pots_mouse_exited() -> void:
	$Panel/Pots.modulate = Color.WHITE


func _on_visuals_gui_input(event: InputEvent) -> void:
	if GlobalScript.vissuals:
		return
	$Panel/Visuals.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.vissuals = true


func _on_visuals_mouse_exited() -> void:
	$Panel/Visuals.modulate = Color.WHITE



func _on_coins_gui_input(event: InputEvent) -> void:
	if GlobalScript.collectible:
		return
	$Panel/Coins.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.collectible = true

func _on_coins_mouse_exited() -> void:
	$Panel/Coins.modulate = Color.WHITE


func _on_dash_gui_input(event: InputEvent) -> void:
	if GlobalScript.dash:
		return
	$Panel/Dash.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.dash = true


func _on_dash_mouse_exited() -> void:
	$Panel/Dash.modulate = Color.WHITE


func _on_story_gui_input(event: InputEvent) -> void:
	if GlobalScript.story:
		return
	$Panel/Story.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.story = true


func _on_story_mouse_exited() -> void:
	$Panel/Story.modulate = Color.WHITE


func _on_skip_gui_input(event: InputEvent) -> void:
	if GlobalScript.skip:
		return
	$Panel/Skip.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.skip = true


func _on_skip_mouse_exited() -> void:
	$Panel/Skip.modulate = Color.WHITE


func _on_trap_gui_input(event: InputEvent) -> void:
	if GlobalScript.trap_rock:
		return
	$Panel/Trap.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		GlobalScript.trap_rock = true


func _on_trap_mouse_exited() -> void:
	$Panel/Trap.modulate = Color.WHITE


func _on_error_gui_input(event: InputEvent) -> void:
	$Panel/Error.modulate = Color.AQUAMARINE
	if Input.is_action_just_pressed("left_click"):
		error.emit()


func _on_error_mouse_exited() -> void:
	$Panel/Error.modulate = Color.WHITE
