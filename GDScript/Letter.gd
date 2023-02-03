extends Area2D

var mouse_inside = false
var lettersprite

# Called when the node enters the scene tree for the first time.
func _ready():
	lettersprite = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Grab the positions of the mouse and the letter sprite collision area
	var mousePos = get_global_mouse_position()
	var lettershape = get_world_2d().direct_space_state
	
	# If the letter is open (on any frame except for the first frame),
	if lettersprite.frame > 0:
		# and if the mouse isn't hovering over the letter's collision area,
		if not lettershape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			
			# decrement the letter's frame until the box closes (frame 0)
			lettersprite.frame = max(lettersprite.frame - 1, 0)

# If the mouse is hovering over the letter,
func _on_Letter_input_event(_viewport, event, _shape_idx):
	# Increase the letter's animation frame to make the box appear to open
	lettersprite.frame = min(lettersprite.frame + 1, 5)
	
	# If the letter is clicked on, do something
#	if event.is_pressed():
#		var root = get_parent().get_parent().get_parent()
#		var amount = int(root.get_node("LetterAmount/Amount").text)
#		if amount > 0:
#			var letter = root.get_node("TutorialLetters").get_child(amount-1)
#			print(letter.text)
#			#var txt = root.get_node("TextBox/Border/Inner/OK/Label")
