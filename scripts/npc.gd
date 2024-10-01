extends Node2D

var player_close = false
@export var questIndex = 0
@export var interactableID = 0
@export var defaultMsg = "example message"
@export var otherQuestMsg = "Thanks!"
@export var npcName = "Mark"


func _process(_delta):
	if player_close:
		$animation.play("player_close")
	else:
		$animation.play("player_not_close")


func _on_interaction_zone_entered(body):
	if body.is_in_group("player"):
		player_close = true
		Global.closestNpcQuestIndex = questIndex
		Global.closestInteractableID = interactableID
		print("set global ID because of close player: ", interactableID)
		Global.currentName = npcName
		if !Global.questCompleteds[questIndex] and !Global.questStarted[questIndex] and !Global.playerBusy:
			Global.currentText = Global.questStartingMsgs[questIndex]
		elif Global.questStarted[questIndex] and !Global.questCompleteds[questIndex]:
			Global.currentText = Global.questEndingMsgs[questIndex]
		elif Global.playerBusy:
			Global.currentText = otherQuestMsg
		else:
			Global.currentText = defaultMsg
		


func _on_interaction_zone_exited(body):
	if body.is_in_group("player"):
		player_close = false


func _input(_event):
	if Input.is_action_just_pressed("interact"):
		pass


func turn_off():
	$interaction_zone.set_deferred("monitoring", false)
	$npc_collisions/npc_hitbox.set_deferred("disabled", true)
	
func turn_on():
	$interaction_zone.set_deferred("monitoring", true)
	$npc_collisions/npc_hitbox.set_deferred("disabled", false)
