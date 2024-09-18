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
		


func floor_entered():
	self.visible = true
	$"TileMapLayer 32x Version".enabled = true
	for i in $Elevators.get_children():
		i.turn_on()
	for i in $Stairs.get_children():
		i.turn_on()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	floor_exited()
	"""
	FloorManager.current_floor = floor_name
	
	for i in $Elevators.get_children():
		i.connect("player_entered", $GUI.show_level_select)
		if FloorManager.nextFloorSpawn[0] == "Elevator":
			if i.elevator_id == FloorManager.nextFloorSpawn[1]:
			
				$player.position = i.position
				$player.position.y -= 20
				i.player_is_inside = true
				i.open_with_player_inside()
	
	for i in $Stairs.get_children():
		i.connect("stairs_entered", $player.enter_stairs)
		i.connect("stairs_exited", $player.exit_stairs)
		if FloorManager.nextFloorSpawn[0] == "StairsUp":
			if i.stairs_id == FloorManager.nextFloorSpawn[1]:
				print(i.name)
				$player.position = i.position
				print($player.position)
				$player.position.y -= 50
		if FloorManager.nextFloorSpawn[0] == "StairsDown":
			if i.stairs_id == FloorManager.nextFloorSpawn[1]:
				print(i.name)
				$player.position = i.position
				$player.position.x -= 20
				$player.position.y -= 30
	"""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
