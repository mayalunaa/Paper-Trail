extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Folder_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		print("Folder clicked")
