extends AnimationPlayer

var textBox
var textBoxFadeAway = false
var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	textBox = get_parent().get_node("TextBox")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter = counter + 0.1
	self.get_node("Arrow").position.y = 348 + (10 * sin(counter))
	
	if textBoxFadeAway:
		textBox.modulate.a = max(textBox.modulate.a - 0.025, 0)
		if textBox.modulate.a == 0:
			textBoxFadeAway = false

func _on_Letter_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		self.play("LetterFadeAway")
		if textBox.modulate.a != 0:
			textBoxFadeAway = true
