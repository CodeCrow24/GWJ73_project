extends GUI_Element

var elevator_that_opened_level_select
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in $ControlPanelPanel/Buttons.get_children():
		i.connect("open_doors", open_doors)

func open_doors():
	if elevator_that_opened_level_select != null:
		elevator_that_opened_level_select.open_with_player_inside()
		get_parent().hide_level_select()

func show():
	super()
	get_tree().root.get_node("main").get_node("player/Camera2D").position_smoothing_enabled = false




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hide":
		get_tree().root.get_node("main").get_node("player/Camera2D").position_smoothing_enabled = true
