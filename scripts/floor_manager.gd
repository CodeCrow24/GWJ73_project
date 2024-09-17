extends Node

@export var floors = [preload("res://scenes/floors/Floor 0.tscn"),preload("res://scenes/floors/Floor 1.tscn")]
var current_floor

func go_to_floor(floor_name):
	var floor_to_load
		
	match floor_name:
		"Floor 0":
			floor_to_load = floors[0]
		"Floor 1":
			floor_to_load = floors[1]
	
	if floor_to_load != null:
		if current_floor != floor_name: 
			
			get_tree().change_scene_to_packed(floor_to_load)
