extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

# If the "LetterFadeAway" animation has finished,
func _on_LetterFade_animation_finished(anim_name):
	if anim_name == "LetterFadeAway":
		
		# Hide the segmented black box, the arrow, and the letter amount
		self.get_node("LetterBorder").visible = false
		self.get_parent().get_node("Arrow").visible = false
		self.get_parent().get_node("LetterAmount").visible = false
