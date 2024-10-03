extends GUI_Element

@export var charTime = 0.05
var percentR = 0
var showText = false
var showBox = false
var showTextDone = false
var showingText = false
@onready var animPlayer = get_parent().get_node("AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	$dialouge_box/text.visible_ratio = 0.0
	$dialouge_box/char_timer.wait_time = charTime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	enterIndicator()
	checkGlobalShowDialouge()
	if !showText:
		$dialouge_box/text.visible_ratio = 0.0


func checkGlobalShowDialouge():
	showBox = Global.showDiaBox
	if Global.showDiaBox and !showingText:
		show_text(Global.currentText)

func enterIndicator():
	if showTextDone == true:
		$dialouge_box/text_finished.visible = true
	else:
		$dialouge_box/text_finished.visible = false


func _on_timer_timeout():
	if showText:
		$dialouge_box/text.visible_ratio += percentR
	if $dialouge_box/text.visible_ratio == 1.0:
		showTextDone = true
		
		
func show_text(Newtext):
	
	$dialouge_box/text.visible_ratio = 0.0
	percentR = 1.0 / Newtext.length()
	$dialouge_box/text.text = Newtext #OMG ist das DUMM
	$dialouge_box/speaker_name.text = Global.currentName
	show()
	showingText = true
	
func _input(_event):
	if Input.is_action_just_pressed("dialouge_accept") and showTextDone:
		showText = false
		showTextDone = false
		Global.showDiaBox = false
		hide()






func _on_char_timer_timeout() -> void:
	if showText:
		$dialouge_box/text.visible_ratio += percentR
	if $dialouge_box/text.visible_ratio == 1.0:
		showTextDone = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "show":
		showText = true
	elif anim_name == "hide":
		showingText = false
