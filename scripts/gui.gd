extends CanvasLayer

var stairDestData = ["Floor", "Stairs", 0]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$bg_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#var elevator_that_opened_level_select

func show_level_select(elevator):
	print("elevator")
	$bg_music.stop()
	$LevelSelect.elevator_that_opened_level_select  = elevator
	$transition_shader.set_curtain()
	Global.showTransitionFade = true
	$AnimationPlayer.play("show_level_select")
	$elevator_music.play()
	#$LevelSelect.visible = true
	
func hide_level_select():
	#$LevelSelect.visible = false
	get_tree().root.get_node("main").get_node("player/Camera2D").position_smoothing_enabled = false
	$AnimationPlayer.play("hide_level_select")
	Global.showTransitionFade = false
	$elevator_music.stop()
	$elevator_bell.play()
	$bg_music.play()
	#$Timer.start()

func stairs_transition_in(DestinationFloor, stairs_type, stairs_id):
	if !Global.shaderActive:
		Global.showTransitionFade = true
		Global.shaderActive = true
	stairDestData = [DestinationFloor, stairs_type, stairs_id]
	$transition_shader.set_radial()
	$AnimationPlayer.play("StairsFadeIn")
	

func _on_timer_timeout():
	Global.showTransitionFade = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hide_level_select":
		get_tree().root.get_node("main").get_node("player/Camera2D").position_smoothing_enabled = true
	elif anim_name == "StairsFadeIn":
		if Global.shaderActive:
			Global.showTransitionFade = false
			Global.shaderActive = false
		FloorManager.go_to_floor(stairDestData[0],stairDestData[1],stairDestData[2])
		get_tree().root.get_node("main").get_node("player/Camera2D").position_smoothing_enabled = false
		$AnimationPlayer.play("StairsFadeIn")
	elif anim_name == "StairsFadeOut":
		get_tree().root.get_node("main").get_node("player/Camera2D").position_smoothing_enabled = true
	elif anim_name == "hide_flipchart":
		$FlipchartDrawingPanel.hide_flipchart()
	if anim_name == "hide_flipchart" or anim_name == "show_flipchart":
		Global.flipcharttrans = false
	if anim_name == "hide_funfact" or anim_name == "show_funfact":
		Global.funfacttrans = false

func show_funfact(funfact):
	$FunFactPanel.show_funfact(funfact)
	$AnimationPlayer.play("show_funfact")
func hide_funfact():
	$FunFactPanel.hide_funfact()
	$AnimationPlayer.play("hide_funfact")

func show_flipchart(body):
	$AnimationPlayer.play("show_flipchart")
	$FlipchartDrawingPanel.show_flipchart(body)

func hide_flipchart():
	$AnimationPlayer.play("hide_flipchart")
	#$FlipchartDrawingPanel.hide_flipchart()
