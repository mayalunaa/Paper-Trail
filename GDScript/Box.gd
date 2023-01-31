extends Area2D

var boxsprite

# Called when the node enters the scene tree for the first time.
func _ready():
	boxsprite = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Grab the positions of the mouse and the box sprite collision area
	var mousePos = get_global_mouse_position()
	var boxshape = get_world_2d().direct_space_state
	
	# If the box is open (on any frame except for the first frame),
	if boxsprite.frame > 0:
		# and if the mouse isn't hovering over the box's collision area,
		if not boxshape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			
			# decrement the box's frame until the box closes (frame 0)
			boxsprite.frame = max(boxsprite.frame - 1, 0)

# If the mouse is hovering over the box,
func _on_Box_input_event(_viewport, event, _shape_idx):
	
	# Increase the box's animation frame to make the box appear to open
	boxsprite.frame = min(boxsprite.frame + 1, 5)
	
	# If the box is clicked on, do something
	if event.is_pressed():
		print("Box clicked")
