extends Node2D

var player_close = false
@export var interactableID = 0


func _process(_delta):
	if player_close:
		$animation.play("player_close")
	else:
		$animation.play("player_not_close")


func _on_interaction_zone_entered(body):
	if body.is_in_group("player"):
		player_close = true
		Global.closestInteractableID = interactableID
		print("set global ID because of close player: ", interactableID)


func _on_interaction_zone_exited(body):
	if body.is_in_group("player"):
		player_close = false


func _input(_event):
	if Input.is_action_just_pressed("interact"):
		pass


func turn_off():
	$interaction_zone.set_deferred("monitoring", false)
	$crate_collisions/crate_hitbox.set_deferred("disabled", true)
	
func turn_on():
	$interaction_zone.set_deferred("monitoring", true)
	$crate_collisions/crate_hitbox.set_deferred("disabled", false)
