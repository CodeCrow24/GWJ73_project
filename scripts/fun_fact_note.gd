extends Node2D

var player_close = false
@export var funfact: String = ""

func _process(_delta):
	if player_close:
		$animation.play("player_close")
	else:
		$animation.play("player_not_close")




func _input(event):
	if Input.is_action_just_pressed("interact"):
		if player_close:
			if get_tree().root.get_node("main/GUI/FunFactPanel").visible:
				get_tree().root.get_node("main/GUI").hide_funfact()
			else:
				get_tree().root.get_node("main/GUI").show_funfact(funfact)
			


func _on_interaction_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_close = true


func _on_interaction_zone_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_close = false
		get_tree().root.get_node("main/GUI").hide_funfact()
