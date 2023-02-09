extends Area2D

var foldersprite
var lidsprite

# Called when the node enters the scene tree for the first time.
func _ready():
	foldersprite = get_parent()
	lidsprite = foldersprite.get_parent().get_node("FolderLidSprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Grab the positions of the mouse and the letter sprite collision area
	var mousePos = get_global_mouse_position()
	var foldershape = get_world_2d().direct_space_state
	# If the letter is open (on any frame except for the first frame),
	if lidsprite.frame > 0:
		# and if the mouse isn't hovering over the letter's collision area,
		if not foldershape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			# decrement the letter's frame until the box closes (frame 0)
			lidsprite.frame = max(lidsprite.frame - 1, 0)

# If the folder on the wall is clicked, make something happen
func _on_Folder_input_event(_viewport, event, _shape_idx):
	# When the mouse is hovered over the folder's collision box
	# Increase the lid's animation frame to make the box appear to open
	lidsprite.frame = min(lidsprite.frame + 1, 6)
	
#	if event.is_pressed():
#		if foldersprite.frame < 5:
#			foldersprite.frame = foldersprite.frame + 1
#		else:
#			foldersprite.frame = 0
