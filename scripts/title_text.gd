extends Node2D
var mouseOnPlay = false
var mouseOnOpt = false
var mouseOnCred = false
var mouseOnBack = false
var showTitle = true
var titleVis = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkTitleVis()
	updateTitleVis()
			
func updateTitleVis():
	if showTitle != titleVis:
		if titleVis:
			$Play_Button.hide()
			$Options_Button.hide()
			$Credits_Button.hide()
			$back_button.show()
		else: 
			$Play_Button.show()
			$Options_Button.show()
			$Credits_Button.show()
			$back_button.hide()


func checkTitleVis():
	if $Play_Button.is_visible() and $Options_Button.is_visible() and $Credits_Button.is_visible():
		titleVis = true
	else:
		titleVis = false


func _on_play_mouse_entered():
	mouseOnPlay = true


func _on_play_mouse_exited():
	mouseOnPlay = false


func _on_opt_mouse_entered():
	mouseOnOpt = true


func _on_opt_mouse_exited():
	mouseOnOpt = false


func _on_cred_mouse_entered():
	mouseOnCred = true


func _on_cred_mouse_exited():
	mouseOnCred = false


func _on_back_mouse_entered():
	mouseOnBack = true


func _on_back_mouse_exited():
	mouseOnBack = false


func _input(_event):
	if Input.is_action_just_pressed("mouse_left") and (mouseOnPlay or mouseOnCred or mouseOnOpt):
		showTitle = false
	if Input.is_action_just_pressed("mouse_left") and (mouseOnBack):
		showTitle = true
