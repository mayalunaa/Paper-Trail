extends AnimationPlayer

var textBox
var textBoxFadeAway = false

# Called when the node enters the scene tree for the first time.
func _ready():
	textBox = get_parent().get_node("TextBox")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if textBoxFadeAway:
		textBox.modulate.a = max(textBox.modulate.a - 0.025, 0)
		if textBox.modulate.a == 0:
			textBoxFadeAway = false

func _on_Letter_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		self.play("LetterFadeAway")
		if textBox.modulate.a != 0:
			textBoxFadeAway = true
