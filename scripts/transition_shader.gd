extends ColorRect

var fadeSpeed = 0.2


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
