extends Node2D


@export var floors: Array[PackedScene] = []
var current_floor: String = "Floor 0"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in floors:
		$floors.add_child(i.instantiate())
		
	FloorManager.connect("change_to_floor", change_to_floor)
	change_to_floor(current_floor, "Elevator", 0)
	for i in $floors.get_children():
		
		for n in i.get_node("Elevators").get_children():
				#show_level_select
				n.connect("player_entered", $GUI.show_level_select)
		for n in i.get_node("Stairs").get_children():
				n.connect("stairs_entered", $player.enter_stairs)
				n.connect("stairs_exited", $player.exit_stairs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print("test")
	pass#FloorManager.go_to_floor("Floor 0", "Elevator", 0)


func change_to_floor(floor_name, spawn_type, spawn_id):
	for i in $floors.get_children():
		
		if i.floor_name == floor_name:
			i.floor_entered()
	
			FloorManager.current_floor = floor_name
		
			for n in i.get_node("Elevators").get_children():
				#i.connect("player_entered", $GUI.show_level_select)
				if spawn_type == "Elevator":
					if n.elevator_id == spawn_id:
					
						$player.position = n.position
						$player.position.y -= 20
						n.player_is_inside = true
						n.open_with_player_inside()
			
			for n in i.get_node("Stairs").get_children():
				#i.connect("stairs_entered", $player.enter_stairs)
				#i.connect("stairs_exited", $player.exit_stairs)
				if spawn_type == "StairsUp":
					if n.stairs_id == spawn_id:
						print(n.name)
						$player.position = n.position
						print($player.position)
						$player.position.y -= 10
				if spawn_type == "StairsDown":
					if n.stairs_id == spawn_id:
						print(n.name)
						$player.position = n.position
						$player.position.x -= 20
						$player.position.y -= 55
		else:
			i.floor_exited()
	#print(floor)
