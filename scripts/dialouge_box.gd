extends Node2D

@export var charTime = 0.05
var percentR = 0
var showText = false
var showBox = false
var showTextDone = false
var showingText = false
@onready var animPlayer = get_parent().get_node("AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	$text.visible_ratio = 0.0
	$char_timer.wait_time = charTime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enterIndicator()
	checkGlobalShowDialouge()
	if !showText:
		$text.visible_ratio = 0.0


func checkGlobalShowDialouge():
	showBox = Global.showDiaBox
	if Global.showDiaBox and !showingText:
		show_text(Global.currentText)

func enterIndicator():
	if showTextDone == true:
		$text_finished.visible = true
	else:
		$text_finished.visible = false


func _on_timer_timeout():
	if showText:
		$text.visible_ratio += percentR
	if $text.visible_ratio == 1.0:
		showTextDone = true
		
		
func show_text(Newtext):
	$text.visible_ratio = 0.0
	percentR = 1.0 / Newtext.length()
	$text.text = Newtext #OMG ist das DUMM
	$speaker_name.text = Global.currentName
	showDiaBox()
	showingText = true
	
func _input(event):
	if Input.is_action_just_pressed("ui_accept") and showTextDone:
		showText = false
		showTextDone = false
		Global.showDiaBox = false
		hideDiaBox()

func showDiaBox():
	animPlayer.play("showDiaBox")

func hideDiaBox():
	animPlayer.play("hideDiaBox")


func _on_animation_player_finished(anim_name):
	if anim_name == "showDiaBox":
		showText = true
	elif anim_name == "hideDiaBox":
		showingText = false
