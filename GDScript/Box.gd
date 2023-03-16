extends Area2D

var boxsprite
var remaining
var root
var textBox
var textArea
var textBoxFadeOut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().root.get_child(0)
	boxsprite = get_parent()
	remaining = int(root.get_node("BoxAmount/Amount").text)
	textBox = root.get_node("TextBox")
	textArea = textBox.get_node("Border/Inner/Scroll/TextArea")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Grab the positions of the mouse and the box sprite collision area
	var mousePos = get_global_mouse_position()
	var boxshape = get_world_2d().direct_space_state
	
	# If the box is open (on any frame except for the first frame),
	if boxsprite.frame > 0:
		# and if the mouse isn't hovering over the box's collision area,
		if not boxshape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			
			# decrement the box's frame until the box closes (frame 0)
			boxsprite.frame = max(boxsprite.frame - 1, 0)
	
	# If the 'textBoxFadeOut' flag is on, lower transparency of the text box
	# until the text box is invisible, then toggle the flag off
	if textBoxFadeOut:
		textBox.modulate.a = max(textBox.modulate.a - 0.025, 0)
		if textBox.modulate.a == 1:
			textBoxFadeOut = false

# If the mouse is hovering over the box,
func _on_Box_input_event(_viewport, event, _shape_idx):
	
	# Increase the box's animation frame to make the box appear to open
	if boxsprite.frame == 0: root.get_node("BoxSound").play()
	boxsprite.frame = min(boxsprite.frame + 1, 5)
	
	if event.is_pressed():
		
		# If the box is pressed when the tutorial message is showing
		if textArea.get_node("Letter0").visible == true:
			root.get_node("BoxFade").play("BoxFadeAway")
			textArea.get_node("Letter0").visible = false
			textBoxFadeOut = true

		# If the box is pressed and there are packages remaining
		if remaining != 0:
			var background = root.get_node("Background/BackgroundSprite")
			var pngpath = "res://Resources/PNG Exports"
			var letters = int(root.get_node("LetterAmount/Amount").text)
			if remaining > 0 and letters == 0:
				root.get_node("OKSound").play()
				if remaining == 4: background.texture = load(pngpath + "/Cute.png")
				if remaining == 3: background.texture = load(pngpath + "/Paint.png")
				if remaining == 2: root.get_node("Dog").visible = true
				if remaining == 1: background.texture = load(pngpath + "/BobRoss.png")
				remaining = remaining - 1
				root.get_node("BoxAmount/Amount").text = String(remaining)
		
		# If there are no more packages left, make the amount indicator invisible
		if remaining == 0:
			root.get_node("BoxAmount").visible = false
