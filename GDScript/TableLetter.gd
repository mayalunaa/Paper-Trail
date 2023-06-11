extends Area2D

var timer : float
var og_mouse_pos : Vector2
var trans : Sprite
var onLetter : bool
var moveLetter : bool
var root : Node2D
var textbox : ColorRect
var remaining : int
var scroll : ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	trans = get_parent().get_parent().get_node("TransSprite")
	root = get_tree().root.get_child(0)
	textbox = root.get_node("TextBox/Border/Inner/Scroll/TextArea")
	scroll = root.get_node("TextBox/Border/Inner/Scroll/")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	remaining = int(root.get_node("LetterAmount/Amount").text)
	
	var mousePos = get_global_mouse_position()
	var lettershape = get_world_2d().direct_space_state

	if onLetter and not lettershape.intersect_point(mousePos, 1, [], 2147483647, true, true):
		if not moveLetter:
			onLetter = false
			trans.visible = false
			timer = 0
	elif onLetter:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			timer += delta
		else:
			timer = 0
			trans.visible = false

	if timer >= 0.1: holdLetter()

func holdLetter():
	if not trans.visible:
		root.get_node("PickupSound").play()
		trans.visible = true

	var mousePos = get_global_mouse_position()
	if not moveLetter:
		og_mouse_pos = mousePos
		moveLetter = true
	var diff_pos = Vector2(mousePos.x - og_mouse_pos.x, mousePos.y - og_mouse_pos.y)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_parent().offset = diff_pos
		self.position = self.position + diff_pos
	else:
		resetPosition()
		root.get_node("PickupSound").play()

func resetPosition(pos = Vector2(-9,96)):
	moveLetter = false
	get_parent().offset = Vector2()
	self.position = pos
	if pos != Vector2(-9,96): trans.position = pos
	
#func checkIfCorrect(group):
#	if group == "": pass
#	else:
#		var letternum = String(textbox.get_child_count() - remaining)
#		var letter = textbox.get_node("Letter" + letternum)
#		if get_tree().get_nodes_in_group("Board").has(letter):
#			var board = root.get_node("Board/BoardSprite")
#			if board.frame < 5: board.frame = board.frame + 1
#			else: board.frame = 0
#			remaining = int(root.get_node("LetterAmount/Amount").text) - 1
#			root.get_node("LetterAmount/Amount").text = String(remaining)
#			if remaining == 0: root.get_node("LetterAmount").visible = false

func _on_TableLetter_input_event(_viewport, _event, _shape_idx):
	if not onLetter: onLetter = true

func _on_Board_input_event(_viewport, _event, _shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		root.get_node("PickupSound").play()
		var letternum = String(textbox.get_child_count() - remaining)
		var letter = textbox.get_node("Letter" + letternum)
		if get_tree().get_nodes_in_group("Board").has(letter):
			root.get_node("BoardSound").play()
			var board = root.get_node("Board/BoardSprite")
			if board.frame < 5: board.frame = board.frame + 1
			else: board.frame = 0
			remaining = int(root.get_node("LetterAmount/Amount").text) - 1
			root.get_node("LetterAmount/Amount").text = String(remaining)
			if remaining == 0:
				root.get_node("LetterAmount").visible = false
				root.get_node("TableLetter").visible = false
				root.get_node("BoxFade/BoxBorder").visible = true
				root.get_node("BoxAmount").visible = true
				root.get_node("BoxFade").play("BoxFade")
				root.get_node("BoxArrow").visible = true
				for ltr in textbox.get_children():
					ltr.visible = false
				textbox.get_node("Letter0").text = root.get_node("BoxFade/BoxText").text
				scroll.scroll_vertical = 0
				textbox.get_node("Letter0").visible = true

func _on_Trash_input_event(_viewport, _event, _shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		root.get_node("PickupSound").play()
		var letternum = String(textbox.get_child_count() - remaining)
		var letter = textbox.get_node("Letter" + letternum)
		if get_tree().get_nodes_in_group("Trash").has(letter):
			root.get_node("TrashSound").play()
			var trash = root.get_node("Trash/TrashSprite")
			if trash.frame < 5: trash.frame = trash.frame + 1
			else: trash.frame = 0
			remaining = int(root.get_node("LetterAmount/Amount").text) - 1
			root.get_node("LetterAmount/Amount").text = String(remaining)
			if remaining == 0:
				root.get_node("LetterAmount").visible = false
				root.get_node("TableLetter").visible = false
				root.get_node("BoxFade/BoxBorder").visible = true
				root.get_node("BoxAmount").visible = true
				root.get_node("BoxFade").play("BoxFade")
				root.get_node("BoxArrow").visible = true
				for ltr in textbox.get_children():
					ltr.visible = false
				textbox.get_node("Letter0").text = root.get_node("BoxFade/BoxText").text
				scroll.scroll_vertical = 0
				textbox.get_node("Letter0").visible = true

func _on_Folder_input_event(_viewport, _event, _shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		root.get_node("PickupSound").play()
		var letternum = String(textbox.get_child_count() - remaining)
		var letter = textbox.get_node("Letter" + letternum)
		if get_tree().get_nodes_in_group("Folder").has(letter):
			root.get_node("FolderSound").play()
			var folder = root.get_node("Folder/FolderSprite")
			if folder.frame < 5: folder.frame = folder.frame + 1
			else: folder.frame = 0
			remaining = int(root.get_node("LetterAmount/Amount").text) - 1
			root.get_node("LetterAmount/Amount").text = String(remaining)
			if remaining == 0:
				root.get_node("LetterAmount").visible = false
				root.get_node("TableLetter").visible = false
				root.get_node("BoxFade/BoxBorder").visible = true
				root.get_node("BoxAmount").visible = true
				root.get_node("BoxFade").play("BoxFade")
				root.get_node("BoxArrow").visible = true
				for ltr in textbox.get_children():
					ltr.visible = false
				textbox.get_node("Letter0").text = root.get_node("BoxFade/BoxText").text
				scroll.scroll_vertical = 0
				textbox.get_node("Letter0").visible = true

func _on_Letter_input_event(_viewport, _event, _shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		root.get_node("PickupSound").play()

func _on_Box_input_event(_viewport, _event, _shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		root.get_node("PickupSound").play()
