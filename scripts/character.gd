extends CharacterBody2D


class_name Player

# quest variables #
var isQuestActive = false   # Is the player doing a quest
var host                    # Npc that gave the quest
var activeQuestIndex        # Index of quest in global list
var activeQuest             # List of steps of active quest
var numQuestTasks = 0       # Number of steps in active quest
var numCompletedTasks = 0   # Number of completed steps in active quest
var currentStepIndex = 0    # Index of current step
var closeToObject = false   # If player is close to a quest object (npc, crate, etc)
var closestNpc              # Npc that is closest to player
var closestObjectType       # Type of closest quest object

@export var SPEED = 50
var player_state
var last_dir = "s-idle"

var current_stairs = null

func enter_stairs(stairs):
	print("enter")
	current_stairs = stairs

func exit_stairs():
	print("exit")
	current_stairs = null

func _physics_process(delta):
	# QUEST SYSTEM PROCESS { #
	
	
	
	
	# } QUEST SYSTEM PROCESS #
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walk"
	
	
			
		
	
	
	if current_stairs != null:
		direction.y = 0
		if current_stairs.direction == current_stairs.directions.Left:
			if direction.x > 0:
				direction.y = -current_stairs.y_add
			elif direction.x < 0:
				direction.y = current_stairs.y_add
		velocity = direction * SPEED
		position += velocity * delta
	
	else:
		velocity = direction * SPEED
		move_and_slide()
	
	play_animation(direction)
	
func play_animation(dir):
	if player_state== "idle":
		$anim.play(last_dir)
	elif player_state == "walk":
		if dir.y == -1 and dir.x == 0:
			$anim.play("n-walk")
			last_dir = "n-idle"
		elif dir.y == 1 and dir.x == 0:
			$anim.play("s-walk")
			last_dir = "s-idle"
		elif dir.x == -1 and dir.y == 0:
			$anim.play("w-walk")
			last_dir = "w-idle"
		elif dir.x == 1 and dir.y == 0:
			$anim.play("e-walk")
			last_dir = "e-idle"
		

func _input(_event):
	
	# QUEST SYSTEM { #
	if Input.is_action_just_pressed("interact") and closeToObject:
		print_rich("[color=white][b][DEBUG]: Interacted[/b][/color]")
		handleInteraction(closestObjectType)
	# } QUEST SYSTEM #
		
	if Input.is_action_just_pressed("mouse_right"):
		position = get_global_mouse_position()
		
		
func startQuest(index : int, hostNpc):
	host = hostNpc
	activeQuestIndex = index
	activeQuest = Global.quests[index]
	numQuestTasks = activeQuest.size()
	numCompletedTasks = 0
	isQuestActive = true
	printerr("started quest: ", activeQuest)
	
func completeStep():
	print_rich("[color=yellow][b][DEBUG]: current step finished: [/b][/color]", currentStep())
	numCompletedTasks += 1
	currentStepIndex += 1
	
	checkQuestCompletion()
	
	
func nextStep() -> String:
	return activeQuest[currentStepIndex + 1]
	
func currentStep() -> String:
	return activeQuest[currentStepIndex]

func checkQuestCompletion():
	if numCompletedTasks == numQuestTasks and numQuestTasks != 0 :
		print_rich("[color=green][b][DEBUG]: quest completed: [/b][/color]", activeQuest)
		host = null
		activeQuestIndex = null
		activeQuest = null
		numQuestTasks = 0
		numCompletedTasks = 0
		isQuestActive = false
	




func _on_interaction_radius_body_entered(body):
	if body.is_in_group("npcs") or body.is_in_group("interactables"):
		printerr("near object")
		closeToObject = true
	if body.is_in_group("npcs"):
		closestNpc = body
		closestObjectType = "npc"
	elif body.is_in_group("interactables"):
		closestObjectType = "crate"
		


func _on_interaction_radius_body_exited(body):
	if body.is_in_group("npcs") or body.is_in_group("interactables"):
		printerr("not near object")
		closeToObject = false
		
	

func handleInteraction(type: String):
	if type == "crate":
		if  isQuestActive and currentStep() == "getCrate":
			completeStep()
	if type == "npc":
		if !isQuestActive:
			startQuest(Global.closestNpcQuestIndex, closestNpc)
		elif isQuestActive and currentStep() == "goToNpc":
			completeStep()
	
		
