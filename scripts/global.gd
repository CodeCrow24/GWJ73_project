extends Node
#	Put global variables in here, you can access this from any scene or node
#	in other scripts type global.variableName to access your variable
var Transition_Shader_Progress = 1 # Transition Black Fade
var showTransitionFade = false
var TransitionShown = false


func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		Global.showTransitionFade = false
