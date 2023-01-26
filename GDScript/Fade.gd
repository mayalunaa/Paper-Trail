extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_node("Black").visible = true
	self.play("Fade")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(_delta):
# 	pass

func _on_Fade_animation_finished(anim_name):
	if anim_name == "Fade":
		self.get_node("Black").visible = false
		
		get_parent().get_node("LetterFade/LetterBorder").visible = true
		
		get_parent().get_node("LetterFade/Arrow").modulate.a = 0
		get_parent().get_node("LetterFade/Arrow").visible = true
		
		get_parent().get_node("TextBox").modulate.a = 0
		get_parent().get_node("TextBox").visible = true
		
		get_parent().get_node("LetterFade").play("LetterFade")
