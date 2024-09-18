extends NinePatchRect

var rng = RandomNumberGenerator.new()

func _ready():
	
<<<<<<< Updated upstream
	pass

func show_funfact(funfact):
	visible = true
	
	$FunFactLabel.text = funfact
=======
	show_funfact(Global.FunFacts[0])

func show_funfact(funfact):
	visible = true
	if Global.FunFacts.size() > 0:
		$FunFactLabel.text = funfact
>>>>>>> Stashed changes

func hide_funfact():
	visible = false
	
<<<<<<< Updated upstream
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit_menu"):
		hide_funfact()
=======
>>>>>>> Stashed changes
