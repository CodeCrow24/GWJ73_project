extends GUI_Element

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func set_text(funfact):
	$FunFactLabel.text = funfact

func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("exit_menu"):
		hide()
		Global.funfact_shown = false
