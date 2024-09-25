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
var activeQuestIds          # IDs of quest objects

# DIALOUGE VARIABLES #
var speaking = false



@export var Max_Speed = 70
@export var SPEED = 50

var player_state
var last_dir = "s-idle"

var current_stairs = null

var ice_areas = []

func enter_stairs(stairs):
	print("enter")
	current_stairs = stairs

func exit_stairs():
	print("exit")
	current_stairs = null

func _physics_process(delta):
	
	Global.playerBusy = isQuestActive
	
	speaking = Global.showDiaBox
	
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walk"
	
	
			
		
	SPEED = Max_Speed
	
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
		if len(ice_areas) > 0:
			SPEED += 20
		
		
		if direction != Vector2.ZERO:
			#direction += input_vector * ACCELERATION
			#direction = direction.clamped(MAX_SPEED)
			direction = direction.normalized()
			velocity = direction * SPEED
			
			
		elif len(ice_areas) > 0:
			
			velocity = lerp(velocity, Vector2.ZERO, 0.03)
		else:
			direction = direction.normalized()
			velocity = direction * SPEED
		
		if !speaking:
			move_and_slide()
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				c.get_collider().apply_central_impulse(-c.get_normal() * 10)
	
	play_animation(direction)
	
func play_animation(dir):
	if player_state == "idle" or speaking:
		$anim.play(last_dir)
	elif player_state == "walk" and !speaking:
		if dir.y < -0.5 and abs(dir.x) < 0.5:
			$anim.play("n-walk")
			last_dir = "n-idle"
		elif dir.y > 0.5 and abs(dir.x) < 0.5:
			$anim.play("s-walk")
			last_dir = "s-idle"
		elif dir.x < -0.5 and abs(dir.y) < 0.5:
			$anim.play("w-walk")
			last_dir = "w-idle"
		elif dir.x > 0.5 and abs(dir.y) < 0.5:
			$anim.play("e-walk")
			last_dir = "e-idle"
		elif dir.y == -0.5 and abs(dir.x) == 0.5:
			$anim.play("n-walk")
		elif dir.y == 0.5 and abs(dir.x) == 0.5:
			$anim.play("s-walk")
 		

func _input(_event):
	
	# QUEST SYSTEM { #
	if Input.is_action_just_pressed("interact") and closeToObject:
		print_rich("[color=white][b][DEBUG]: Interacted, type: [/b][/color]", closestObjectType)
		handleInteraction(closestObjectType)
	# } QUEST SYSTEM #
		
	if Input.is_action_just_pressed("mouse_right"):
		position = get_global_mouse_position()
		
		
func startQuest(index : int, hostNpc):
	host = hostNpc
	activeQuestIndex = index
	activeQuestIds = Global.questIDs[activeQuestIndex]
	activeQuest = Global.quests[index]
	numQuestTasks = activeQuest.size()
	numCompletedTasks = 0
	isQuestActive = true
	Global.questStarted[index] = true
	print_rich("[color=light_blue][b][DEBUG]: started quest: [/b][/color]", activeQuest)
	
	
func completeStep():
	print_rich("[color=yellow][b][DEBUG]: current step finished: [/b][/color]", currentStep())
	numCompletedTasks += 1
	currentStepIndex += 1
	
	checkQuestCompletion()
	
	
func nextStep() -> String:
	return activeQuest[currentStepIndex + 1]
	
func currentStep() -> String:
	if currentStepIndex < activeQuest.size():
		return activeQuest[currentStepIndex]
	else:
		return "none"
	
func currentStepID() -> int:
	if isQuestActive:
		return activeQuestIds[currentStepIndex]
	else:
		return 0

func checkQuestCompletion():
	if numCompletedTasks == numQuestTasks and numQuestTasks != 0 :
		print_rich("[color=green][b][DEBUG]: quest completed: [/b][/color]", activeQuest)
		Global.questCompleteds[activeQuestIndex] = true
		host = null
		activeQuestIndex = null
		activeQuest = null
		numQuestTasks = 0
		numCompletedTasks = 0
		isQuestActive = false
		currentStepIndex = 0
	




func _on_interaction_radius_body_entered(body):
	if body.is_in_group("npcs") or body.is_in_group("interactables"):
		closeToObject = true
	if body.is_in_group("npcs"):
		closestNpc = body
		closestObjectType = "npc"
	elif body.is_in_group("interactables"):
		closestObjectType = "crate"
		


func _on_interaction_radius_body_exited(body):
	if body.is_in_group("npcs") or body.is_in_group("interactables"):
		closeToObject = false
		
	

func handleInteraction(type: String):
	if type == "crate":
		printerr("iID crates, quest activty: ", isQuestActive, " stepID: ", currentStepID())
		if  isQuestActive and currentStep() == "getCrate" and Global.closestInteractableID == currentStepID():
			completeStep()
	if type == "npc":
		if Global.currentText != null:
			Global.showDiaBox = true
		printerr("iID npcs, quest activty: ", isQuestActive, " stepID: ", currentStepID())
		if !isQuestActive:
			if !Global.questCompleteds[Global.closestNpcQuestIndex]:
				startQuest(Global.closestNpcQuestIndex, closestNpc)
			else: 
				print_rich("[color=red][b][DEBUG]: QUEST ALREADY FINISHED[/b][/color]")
		elif isQuestActive and currentStep() == "goToNpc" and Global.closestInteractableID == currentStepID():
			completeStep()
	if type != "npc" and isQuestActive:
		Global.currentName = "me"
		Global.currentText = Global.questStepMsgs[activeQuestIndex][currentStepIndex - 1]
		Global.showDiaBox = true
	
		
