extends NinePatchRect

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func show_funfact(funfact):
	visible = true
	
	$FunFactLabel.text = funfact




func hide_funfact():
	visible = false

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("exit_menu"):
		
		hide_funfact()
