extends Node2D

@export var hours = 0
@export var minutes = 0
@export var seconds = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	set_seconds(Global.current_time.get("second"))
	set_minutes(Global.current_time.get("minute"))
	set_hours(Global.current_time.get("hour"))

func set_hours(hours):
	var temp = (int(float(hours) / 12.0 * 32.0))+16
	while temp > 31:
		temp -= 32
	$Hour.frame_coords.x = (temp)

func set_minutes(minutes):
	var temp = (int(float(minutes) / 60.0 * 32.0))+16
	while temp > 31:
		temp -= 32
	$Minute.frame_coords.x = (temp)

func set_seconds(seconds):
	var temp = (int(float(seconds) / 60.0 * 32.0))+16
	while temp > 31:
		temp -= 32
	$Second.frame_coords.x = (temp)
