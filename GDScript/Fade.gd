extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ensure that the black box is visible and play the Fade animation
	self.get_node("Black").visible = true
	self.play("Fade")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(_delta):
# 	pass

# Once the "Fade" animation is finished,
func _on_Fade_animation_finished(anim_name):
	if anim_name == "Fade":
		# Turn the previous black box for "Fade" invisible,
		# Then turn the next black box visible (seamless)
		self.get_node("Black").visible = false
		get_parent().get_node("LetterFade/LetterBorder").visible = true
		
		# The text box, the arrow above the letter, and the number indicator
		# will slowly appear in the "LetterFade" animation so ensure they're
		# visible, yet remain transparent so the animation can begin properly
		get_parent().get_node("TextBox").modulate.a = 0
		get_parent().get_node("TextBox").visible = true
		get_parent().get_node("Arrow").modulate.a = 0
		get_parent().get_node("Arrow").visible = true
		get_parent().get_node("LetterAmount").modulate.a = 0
		get_parent().get_node("LetterAmount").visible = true
		
		# Play the next "LetterFade" animation
		get_parent().get_node("LetterFade").play("LetterFade")
