extends Area2D

var timer : float
var og_mouse_pos : Vector2
var trans : Sprite
var onLetter : bool
var moveLetter : bool
var root : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	trans = get_parent().get_parent().get_node("TransSprite")
	root = get_tree().root.get_child(0)
	print(root.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var mousePos = get_global_mouse_position()
	var lettershape = get_world_2d().direct_space_state

	if onLetter and not lettershape.intersect_point(mousePos, 1, [], 2147483647, true, true):
		if not moveLetter:
			onLetter = false
			trans.visible = false
			timer = 0
	elif onLetter:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			if timer < 0.25: print(timer)
			timer += delta
		else:
			timer = 0
			trans.visible = false

	if timer >= 0.25: moveLetter()

func moveLetter():
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

func resetPosition(pos = Vector2(-9,96)):
	moveLetter = false
	get_parent().offset = Vector2()
	self.position = pos
	if pos != Vector2(-9,96): trans.position = pos

func _on_TableLetter_input_event(_viewport, _event, _shape_idx):
	if not onLetter: onLetter = true

func _on_Board_input_event(viewport, event, shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		var board = root.get_node("Board/BoardSprite")
		if board.frame < 5:
			board.frame = board.frame + 1
		else:
			board.frame = 0

func _on_Trash_input_event(viewport, event, shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		var trash = root.get_node("Trash/TrashSprite")
		if trash.frame < 5:
			trash.frame = trash.frame + 1
		else:
			trash.frame = 0

func _on_Folder_input_event(viewport, event, shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		var folder = root.get_node("Folder/FolderSprite")
		if folder.frame < 5:
			folder.frame = folder.frame + 1
		else:
			folder.frame = 0

func _on_Letter_input_event(viewport, event, shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		var letter = root.get_node("Letter/LetterSprite")
		if letter.frame < 5:
			letter.frame = letter.frame + 1
		else:
			letter.frame = 0

func _on_Box_input_event(viewport, event, shape_idx):
	if moveLetter and not Input.is_mouse_button_pressed(BUTTON_LEFT):
		resetPosition()
		var box = root.get_node("Box/BoxSprite")
		if box.frame < 5:
			box.frame = box.frame + 1
		else:
			box.frame = 0
