extends Area2D

var textbox
var fadeOutTextbox = false

# Called when the node enters the scene tree for the first time.
func _ready():
	textbox = get_parent().get_parent().get_parent().get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# If the 'fadeOutTextbox' flag is toggled, lower the transparency
	# until the textbox is invisible, and toggle the flag off
	if fadeOutTextbox:
		textbox.modulate.a = max(textbox.modulate.a - 0.02, 0)
		if textbox.modulate.a == 0:
			fadeOutTextbox = false

# If the OK button is clicked, toggle the 'fadeOutTextbox' flag
func _on_OKButton_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		print("OK clicked")
		fadeOutTextbox = true
