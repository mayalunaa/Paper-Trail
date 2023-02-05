extends Area2D

var trashsprite

# Called when the node enters the scene tree for the first time.
func _ready():
	trashsprite = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# If the trash can on the floor is clicked, make something happen
func _on_Trash_input_event(_viewport, event, _shape_idx):
	if event.is_pressed():
		if trashsprite.frame < 5:
			trashsprite.frame = trashsprite.frame + 1
		else:
			trashsprite.frame = 0
