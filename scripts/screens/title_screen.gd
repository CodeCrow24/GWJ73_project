extends Node2D

var main_scene = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$intro_delay.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		move(Vector2(-10,0))
	if Input.is_action_just_pressed("right"):
		move(Vector2(10,0))

func move(vec: Vector2):
	$Middle.position += vec
	$Middle.position.x = min(max($Middle.position.x,-30), 30)
	$Middle.position.y = min(max($Middle.position.y,-10), 10)

	$Front.position += vec*0.3
	$Front.position.x = min(max($Front.position.x,-7), 7)
	$Front.position.y = min(max($Front.position.y,-3), 3)

func _input(event):
	if event is InputEventMouseMotion:
		move(0.02*event.relative)
		


func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene)


func _on_options_pressed() -> void:
	for i in range(1000):
		printerr("This is Optional")


func _on_quit_pressed() -> void:
	print("Quit")
	get_tree().quit()


func _on_intro_delay_timeout():
	$"black rect/blackRect".visible = false
	$AnimationPlayer.play("intro")
