extends Sprite


# Declare member variables here. Examples:
var root
var pngpath


# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree().root.get_child(0)
	pngpath = "res://Resources/PNG Exports"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if int(self.get_node("Amount").text) >= 10:
		self.texture = load(pngpath + "/AmountIndicatorWide.png")
		self.get_node("Amount").rect_size = Vector2(26,55)
		self.get_node("Amount").set_position(Vector2(-9,-16))
	if int(self.get_node("Amount").text) < 10:
		self.texture = load(pngpath + "/AmountIndicator.png")
		self.get_node("Amount").rect_size = Vector2(16,55)
		self.get_node("Amount").set_position(Vector2(-7,-16))
