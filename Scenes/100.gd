extends Area2D

var root
var textBox
var textArea
var textBoxFadeIn = false
var scroll

# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().root.get_child(0)
	textBox = root.get_node("TextBox")
	textArea = textBox.get_node("Border/Inner/Scroll/TextArea")
	scroll = textBox.get_node("Border/Inner/Scroll")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if textBoxFadeIn:
		textBox.modulate.a = min(textBox.modulate.a + 0.025, 1)
		if textBox.modulate.a == 1:
			textBoxFadeIn = false

func _on_100_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		if int(root.get_node("BoxAmount/Amount").text) == 0:
			self.visible = false
			
			scroll.scroll_vertical = 0
			
			var letter = textArea.get_node("Letter7")
			letter.text = root.get_node("100/EndLabel").text
			textBoxFadeIn = true
			textBox.visible = true
			letter.visible = true
