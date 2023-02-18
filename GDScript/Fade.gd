extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ensure that the black box is visible and play the Fade animation
	self.get_node("Black").visible = true
	self.play("Fade")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

# Once the "Fade" animation is finished,
func _on_Fade_animation_finished(anim_name):
	if anim_name == "Fade":
		# Turn the previous black box for "Fade" invisible,
		# Then turn the next black box visible (seamless)
		self.get_node("Black").visible = false
		get_parent().get_node("LetterFade/LetterBorder").visible = true
		
		# Ensure the arrow is visible but transparent (looks weird otherwise)
		get_parent().get_node("LetterArrow").modulate.a = 0
		get_parent().get_node("LetterArrow").visible = true
		
		# Play the next "LetterFade" animation
		get_parent().get_node("LetterFade").play("LetterFade")
