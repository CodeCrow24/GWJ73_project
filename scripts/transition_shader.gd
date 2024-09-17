extends ColorRect
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	material.set_shader_parameter('cutoff', Global.Transition_Shader_Progress)
