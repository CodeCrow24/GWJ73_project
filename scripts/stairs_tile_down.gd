extends StaticBody2D



func turn_on():
	$CollisionPolygon2D.set_deferred("disabled", false)
	
	$Area2D.set_deferred("monitoring", true)
	

func turn_off():
	$CollisionPolygon2D.set_deferred("disabled", true)
	
	$Area2D.monitoring = false



signal stairs_entered(stairs)
signal stairs_exited
enum directions {Left, Right}
@export var direction: directions = directions.Left
@export var y_add: float = 0.5
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
		get_tree().root.get_node("main").change_to_floor(DestinationFloor, "StairsDown", stairs_id)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		$Sprite2DFront.z_index=0
		stairs_exited.emit()
