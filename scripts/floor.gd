extends Node
class_name floor

@export var floor_name: String
@export var Start_Elevator_ID = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FloorManager.current_floor = floor_name

	for i in $Elevators.get_children():
		i.connect("player_entered", $GUI.show_level_select)
		if i.elevator_id == Start_Elevator_ID:
			
			$player.position = i.position
			$player.position.y -= 20
			i.player_is_inside = true
			i.open_with_player_inside()
			break


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
