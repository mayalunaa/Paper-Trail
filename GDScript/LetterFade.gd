extends AnimationPlayer

var textBox
var textBoxFadeAway = false
var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	textBox = get_parent().get_node("TextBox")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Move the Arrow up and down using a sin function
	counter = (counter + 0.1) / 1
	self.get_parent().get_node("Arrow").position.y = 348 + (10 * sin(counter))
	
	# If the 'textBoxFadeAway' flag is on, lower transparency of the text box
	# until the text box is invisible, then toggle the flag off
	if textBoxFadeAway:
		textBox.modulate.a = max(textBox.modulate.a - 0.025, 0)
		if textBox.modulate.a == 0:
			textBoxFadeAway = false

# If the letter is clicked on, toggle the 'textBoxFadeAway' away
func _on_Letter_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		self.play("LetterFadeAway")
		if textBox.modulate.a != 0:
			textBoxFadeAway = true

# If the "LetterFadeAway" animation has finished,
func _on_LetterFade_animation_finished(anim_name):
	if anim_name == "LetterFadeAway":
		
		# Hide the segmented black box, the arrow, and the letter amount
		self.get_node("LetterBorder").visible = false
		self.get_parent().get_node("Arrow").visible = false
		self.get_parent().get_node("LetterAmount").visible = false
