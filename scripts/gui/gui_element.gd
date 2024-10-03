extends Node

class_name GUI_Element

var active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show():
	self.visible = true
	$AnimationPlayer.play("show")
	active = true

func hide():
	$AnimationPlayer.play("hide")
	active = false
