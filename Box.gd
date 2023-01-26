extends Area2D

var mouse_inside = false
var boxsprite

# Called when the node enters the scene tree for the first time.
func _ready():
	boxsprite = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mousePos = get_global_mouse_position()
	var boxshape = get_world_2d().direct_space_state
	
	if boxsprite.frame > 0:
		if not boxshape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			boxsprite.frame = max(boxsprite.frame - 1, 0)

func _on_Box_input_event(_viewport, event, _shape_idx):
	boxsprite.frame = min(boxsprite.frame + 1, 5)
	if event.is_pressed():
		print("Box clicked")
