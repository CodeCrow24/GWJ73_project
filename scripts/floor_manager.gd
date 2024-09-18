extends Node

signal change_to_floor(floor, spawn_type, spawn_id)

@export var floors = [preload("res://scenes/floors/Floor 0.tscn"),preload("res://scenes/floors/Floor 1.tscn"),preload("res://scenes/floors/Floor 2.tscn")]
var current_floor

var nextFloorSpawn = ["Elevator", 0]

func go_to_floor(floor_name, spawn_type, spawn_id):
	var floor_to_load
		
	match floor_name:
		"Floor 0":
			floor_to_load = floors[0]
		"Floor 1":
			floor_to_load = floors[1]
		"Floor 2":
			floor_to_load = floors[2]
	
	if floor_to_load != null:
		nextFloorSpawn = [spawn_type, spawn_id]
		if current_floor != floor_name: 
			change_to_floor.emit(floor_name, spawn_type, spawn_id)
			#get_tree().change_scene_to_packed(floor_to_load)
