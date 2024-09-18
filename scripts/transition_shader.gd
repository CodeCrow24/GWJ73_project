extends ColorRect

var fadeSpeed = 0.2

const textures = [preload("res://assets/GUI/curtain.png"), preload("res://assets/GUI/radial.png")]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var fadeVelo = 0
	if Global.TransitionShown != Global.showTransitionFade:
		if Global.showTransitionFade and Global.Transition_Shader_Progress > 0:
			fadeVelo -= fadeSpeed
		elif !Global.showTransitionFade and Global.Transition_Shader_Progress < 1:
			fadeVelo += fadeSpeed
		elif (!Global.showTransitionFade and Global.Transition_Shader_Progress >= 1) or (Global.showTransitionFade and Global.Transition_Shader_Progress <= 0):
			Global.TransitionShown = Global.showTransitionFade
	Global.Transition_Shader_Progress += (fadeVelo * delta) * 10
	material.set_shader_parameter('cutoff', Global.Transition_Shader_Progress)


func set_radial():
	material.set_shader_parameter('smooth_size', 0.26)
	material.set_shader_parameter('scale', 1.0)
	material.set_shader_parameter('use_adjust_aspect_ratio', true)
	material.set_shader_parameter('mask', textures[1])
	
func set_curtain():
	material.set_shader_parameter('smooth_size', 0.5)
	material.set_shader_parameter('scale', 1.0)
	material.set_shader_parameter('use_adjust_aspect_ratio', false)
	material.set_shader_parameter('mask', textures[0])
