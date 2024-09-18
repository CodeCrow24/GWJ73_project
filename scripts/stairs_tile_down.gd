extends StaticBody2D

signal stairs_entered(stairs)
signal stairs_exited
enum directions {Left, Right}
@export var direction: directions = directions.Left
@export var y_add: float = 0.6
@export var stairs_id = 0
@export var DestinationFloor: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		$Sprite2DFront.z_index=9
		stairs_entered.emit(self)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		$Sprite2DFront.z_index=0
		stairs_exited.emit()




func _on_player_moved_up_body_entered(body: Node2D) -> void:
	if body is Player and body.current_stairs == self and DestinationFloor != null:
		FloorManager.go_to_floor(DestinationFloor, "StairsDown", stairs_id)
