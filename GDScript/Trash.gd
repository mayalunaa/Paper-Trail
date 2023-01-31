extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# If the trash can on the floor is clicked, make something happen
func _on_Trash_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		print("Trash clicked")
