extends Node2D

#30 fps (ik now its 15 but no will notice)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("rgb")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer.play("rgb")
