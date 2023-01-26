extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quit_input_event(_viewport, event, _shape_idx):
	print("quit balls")
	if event.is_pressed():
		print("Quit clicked")
		#get_tree().quit()
