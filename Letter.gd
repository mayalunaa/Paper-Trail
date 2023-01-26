extends Area2D

var mouse_inside = false
var lettersprite

# Called when the node enters the scene tree for the first time.
func _ready():
	lettersprite = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mousePos = get_global_mouse_position()
	var lettershape = get_world_2d().direct_space_state
	
	if lettersprite.frame > 0:
		if not lettershape.intersect_point(mousePos, 1, [], 2147483647, true, true):
			lettersprite.frame = max(lettersprite.frame - 1, 0)

func _on_Letter_input_event(_viewport, event, _shape_idx):
	lettersprite.frame = min(lettersprite.frame + 1, 5)
	if event.is_pressed():
		print("Letter clicked")
