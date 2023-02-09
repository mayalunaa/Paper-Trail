extends Area2D

var mouse_inside = false
var lettersprite
var remaining
var root

var textBox
var textArea
var textBoxFadeIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().root.get_child(0)
	lettersprite = get_parent()
	remaining = int(root.get_node("LetterAmount/Amount").text)
	textBox = root.get_node("TextBox")
	textArea = textBox.get_node("Border/Inner/Scroll/TextArea")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	remaining = int(root.get_node("LetterAmount/Amount").text)
	
	# Grab the positions of the mouse and the letter sprite collision area
	var mousePos = get_global_mouse_position()
	var lettershape = get_world_2d().direct_space_state
	# If the letter is open (on any frame except for the first frame),
	if lettersprite.frame > 0:
		# and if the mouse isn't hovering over the letter's collision area,
		if not lettershape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			# decrement the letter's frame until the box closes (frame 0)
			lettersprite.frame = max(lettersprite.frame - 1, 0)

	# If the 'textBoxFadeIn' flag is on, lower transparency of the text box
	# until the text box is invisible, then toggle the flag off
	if textBoxFadeIn:
		textBox.modulate.a = min(textBox.modulate.a + 0.025, 1)
		if textBox.modulate.a == 1:
			textBoxFadeIn = false

# If the mouse is hovering over the letter,
func _on_Letter_input_event(_viewport, event, _shape_idx):
	# Increase the letter's animation frame to make the box appear to open
	lettersprite.frame = min(lettersprite.frame + 1, 5)
	
	if event.is_pressed():
		if textArea.get_node("Letter0").visible == true:
			root.get_node("LetterFade").play("LetterFadeAway")
			textArea.get_node("Letter0").visible = false
			textArea.get_node("Letter1").visible = true
			if textBox.modulate.a == 0:
				textBoxFadeIn = true

		if remaining != 0:
			var textpath = "TextBox/Border/Inner/Scroll/TextArea/"
			var textbox = root.get_node(textpath)
			var letternum = textbox.get_child_count() - remaining
			var letterpath = textpath + "Letter" + String(letternum)
			root.get_node(textpath + "Letter" + String(letternum-1)).visible = false
			root.get_node(letterpath).visible = true
			root.get_node("TextBox").visible = true
			root.get_node("TextBox").modulate.a = 1
			root.get_node("LetterAmount").visible = true
			root.get_node("LetterAmount").modulate.a = 1
		
		else:
			root.get_node("LetterAmount").visible = false
