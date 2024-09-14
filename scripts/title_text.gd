extends Node2D
var mouseOnPlay = false
var mouseOnOpt = false
var mouseOnCred = false
var showTitle = true
var PlaySpeed = 0
var OptSpeed = 0
var CredSpeed = 0
var titleVis = true
var index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Title.position.x = 0
	$Play_Button.position.x = 0
	$Options_Button.position.x = 0
	$Credits_Button.position.x = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkTitleVis()
	moveTitle(delta)


func moveTitle(deltaTime):
	PlaySpeed = 0
	OptSpeed = 0
	CredSpeed = 0
	
	
	if index <= 3 and showTitle != titleVis: 
		index += 0.05
		
	if !showTitle and titleVis:
		if index >= 1:
			PlaySpeed = -600
		if index >= 2:
			OptSpeed = -600
		if index >= 3:
			CredSpeed = -600
	
	$Play_Button.position.x += PlaySpeed * deltaTime
	$Options_Button.position.x += OptSpeed * deltaTime
	$Credits_Button.position.x += CredSpeed * deltaTime
			


func checkTitleVis():
	if $Play_Button.position.x <= -324 and $Options_Button.position.x <= -324 and $Credits_Button.position.x <= -324:
		$Play_Button.position.x = -324
		$Options_Button.position.x = -324
		$Credits_Button.position.x = -324
		titleVis = false
		index = 0


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


func _input(_event):
	if Input.is_action_just_pressed("mouse_left") and (mouseOnPlay or mouseOnCred or mouseOnOpt):
		showTitle = false
