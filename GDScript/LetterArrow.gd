extends Sprite

var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Move the Arrow up and down using a sin function
	counter = (counter + 0.1) / 1
	self.get_parent().get_node("LetterArrow").position.y = 348 + (10 * sin(counter))
