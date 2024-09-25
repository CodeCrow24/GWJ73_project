extends NinePatchRect

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func show_funfact(funfact):
	visible = true
	
	$FunFactLabel.text = funfact




func hide_funfact():
	pass
	#visible = false

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("exit_menu"):
		hide_funfact()
		Global.funfact_shown = false
