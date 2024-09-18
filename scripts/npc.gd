extends Node2D

var player_close = false
@export var questIndex = 0


func _process(_delta):
	if player_close:
		$animation.play("player_close")
	else:
		$animation.play("player_not_close")


func _on_interaction_zone_entered(body):
	if body.is_in_group("player"):
		player_close = true
		Global.closestNpcQuestIndex = questIndex


func _on_interaction_zone_exited(body):
	if body.is_in_group("player"):
		player_close = false


func _input(event):
	if Input.is_action_just_pressed("interact"):
		pass
