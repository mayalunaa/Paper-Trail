extends Area2D

var fade
var fading

# Called when the node enters the scene tree for the first time.
func _ready():
	fade = get_parent().get_node("Fade")
	fade.get_node("Black").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if fading and fade.is_playing() == false:
		get_tree().quit()

func _on_Stop_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		fade.get_node("Black").visible = true
		fade.play("Fade")
		fading = true
