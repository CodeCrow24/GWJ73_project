extends Node
#	Put global variables in here, you can access this from any scene or node
#	in other scripts type global.variableName to access your variable
var Transition_Shader_Progress = 1 # Transition Black Fade





# Called when the global node is loaded
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.


func _input(event):
	if Input.is_action_just_pressed("mouse_left"):
		Transition_Shader_Progress = 1 - Transition_Shader_Progress
