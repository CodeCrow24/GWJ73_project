extends Node
class_name floor

@export var floor_name: String
@export var Start_Elevator_ID = 0


func floor_exited():
	self.visible = false
	$"TileMapLayer 32x Version".enabled = false
	for i in $Elevators.get_children():
		i.turn_off()
	for i in $Stairs.get_children():
		i.turn_off()
	for i in $Puddles.get_children():
		i.turn_off()
		


func floor_entered():
	self.visible = true
	$"TileMapLayer 32x Version".enabled = true
	for i in $Elevators.get_children():
		i.turn_on()
	for i in $Stairs.get_children():
		i.turn_on()
	for i in $Puddles.get_children():
		i.turn_on()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	floor_exited()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
