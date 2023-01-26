extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_node("Black").visible = true
	self.play("Fade")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Fade_animation_finished(_anim_name):
	self.get_node("Black").visible = false
	get_parent().get_node("TextBoxOuter").visible = true
