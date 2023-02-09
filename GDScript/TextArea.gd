extends ColorRect 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Checks the vertical size of any visible text in the text area
	# Updates the rectangle size accordingly so scrolling is accurate
	var children = get_children()
	for child in children:
		if child.visible:
			self.rect_min_size.y = child.rect_size.y
