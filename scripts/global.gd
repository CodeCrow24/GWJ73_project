extends Node
#	Put global variables in here, you can access this from any scene or node
#	in other scripts type global.variableName to access your variable

# SHADER SYSTEM VARIABLES #
var Transition_Shader_Progress = 1 
var showTransitionFade = false
var TransitionShown = false

# QUEST SYSTEM VARIABLES #
var quests = [["getCrate", "goToNpc"], ["getCrate", "goToNpc", "getCrate", "goToNpc"], ["getCrate", "goToNpc", "goToNpc"]]
var questIDs = [[0, 0], [0, 0, 1, 1], [1, 0, 1]]
var questCompleteds = [false, false, false]
var currentPlayerQuestStep
var closestNpcQuestIndex
var closestInteractableID = 0

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		Global.showTransitionFade = false
