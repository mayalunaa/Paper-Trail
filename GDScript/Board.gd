extends Area2D

var boardsprite

# Called when the node enters the scene tree for the first time.
func _ready():
	boardsprite = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# If the board on the wall is clicked, make something happen
func _on_Board_input_event(_viewport, _event, _shape_idx):
	pass
#	if event.is_pressed():
#		if boardsprite.frame < 5:
#			boardsprite.frame = boardsprite.frame + 1
#		else:
#			boardsprite.frame = 0
