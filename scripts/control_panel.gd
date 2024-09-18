extends Control

var elevator_that_opened_level_select
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in $ControlPanelPanel/Buttons.get_children():
		i.connect("open_doors", open_doors)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func open_doors():
	if elevator_that_opened_level_select != null:
		elevator_that_opened_level_select.open_with_player_inside()
		get_parent().hide_level_select()
		
