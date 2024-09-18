extends Node
#	Put global variables in here, you can access this from any scene or node
#	in other scripts type global.variableName to access your variable
var Transition_Shader_Progress = 1 # Transition Black Fade
var showTransitionFade = false
var TransitionShown = false

<<<<<<< Updated upstream
# QUEST SYSTEM VARIABLES #
var quests = [["getCrate", "goToNpc"], ["getCrate", "getCrate", "goToNpc"]]
var currentPlayerQuestStep
var closestNpcQuestIndex
=======
@export var FunFacts: Array[String] = ["...that the first recorded recipe is over 4000 Years old", "...that the longest english word without a vowel is rhythms"] # Did you know ... //

>>>>>>> Stashed changes

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		Global.showTransitionFade = false
