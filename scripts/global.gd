extends Node
#	Put global variables in here, you can access this from any scene or node
#	in other scripts type global.variableName to access your variable

var funfacttrans = false
var flipcharttrans = false

# SHADER SYSTEM VARIABLES #
var Transition_Shader_Progress = 1 
var showTransitionFade = false
var TransitionShown = false

# QUEST SYSTEM VARIABLES #
var quests = [
	["getCrate", "goToNpc"], 
	["getCrate", "goToNpc", "getCrate", "goToNpc"], 
	["getCrate", "goToNpc", "goToNpc"]
]
var questIDs = [
	[0, 0], 
	[0, 0, 1, 1], 
	[1, 0, 1]
]
var questCompleteds = [
	false, 
	false, 
	false
	]
var questStarted = [
	false,
	false,
	false
]
var currentPlayerQuestStep
var closestNpcQuestIndex
var closestInteractableID = 0
var playerBusy = false

var current_time = Time.get_time_dict_from_system()

# INTERACTION SYSTEM VARIABLES #
var currentText
var currentName = "123456789***" #Longest Possible Name
var showDiaBox = false

var questStartingMsgs = [
	"I just need something from the crate on the second floor, would you mind getting it for me?",
	"Hey, do you mind doing me a favor? A friend of mine on the first floor has asked me to get him somthing from the crate on the floor above. Once you've brought it to him, please bring me somthing from the crate here.",
	"Hello, I have a favor to ask, mind bringing my Friend something from the crate up here?"
]
var questEndingMsgs = [
	"Thank you, that was exactly what I needed.",
	"Thank you very much, that saved me a ton of time!",
	"Thanks, you're a big help."
]
var questStepMsgs = [# Every steps dialouge, NPCs excluded
	[#Quest 01
		"I got his stuff, I should probably give it to him now.",
		"N/A" #NPC
	],
	[#Quest 02
		"I got the things I'm supposed to give to his friend now. I should bring them to his friend on the first floor.",
		"N/a", # NPC
		"Ok, now lets just bring this to him.",
		"N/A"
	],
	[#Quest 03
		"Lets get this to his friend now.",
		"N/A",#NPC
		"N/A" #NPC
	]
]

var funfact_shown = false
var flipchart_shown = false

var shaderActive = false

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		Global.showTransitionFade = false

func _process(_delta: float) -> void:
	current_time = Time.get_time_dict_from_system()
