extends Area2D

var timer : float
var og_mouse_pos : Vector2
var trans : Sprite
var onLetter : bool
var moveLetter

# Called when the node enters the scene tree for the first time.
func _ready():
	trans = get_parent().get_parent().get_node("TransSprite")

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
			if timer < 0.5: print(timer)
			timer += delta
		else:
			timer = 0
			trans.visible = false

	if timer >= 0.5: moveLetter()

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
		moveLetter = false
		get_parent().offset = Vector2()
		self.position = Vector2(-9,96)


func _on_TableLetter_input_event(viewport, event, shape_idx):
	if not onLetter: onLetter = true
