extends Node
#	Put global variables in here, you can access this from any scene or node
#	in other scripts type global.variableName to access your variable

# SHADER SYSTEM VARIABLES #
var Transition_Shader_Progress = 1 
var showTransitionFade = false
var TransitionShown = false

<<<<<<< HEAD
# QUEST SYSTEM VARIABLES #
var quests = [["getCrate", "goToNpc"], ["getCrate", "goToNpc", "getCrate", "goToNpc"], ["getCrate", "goToNpc", "goToNpc"]]
var questIDs = [[0, 0], [0, 0, 1, 1], [1, 0, 1]]
var questCompleteds = [false, false, false]
=======

var quests = [["getCrate", "goToNpc"], ["getCrate", "getCrate", "goToNpc"]]
>>>>>>> 93794b98e972c826bf72e029d5df6c38fe3ac74e
var currentPlayerQuestStep
var closestNpcQuestIndex
var closestInteractableID = 0

<<<<<<< HEAD
func _input(_event):
=======

func _input(event):
>>>>>>> 93794b98e972c826bf72e029d5df6c38fe3ac74e
	if Input.is_action_just_pressed("ui_accept"):
		Global.showTransitionFade = false
