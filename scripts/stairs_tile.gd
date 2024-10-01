extends StaticBody2D





func turn_on():
	$CollisionShape2D.set_deferred("disabled", false)
	$CollisionPolygon2D.set_deferred("disabled", false)
	$Area2D.set_deferred("monitoring", true)
	$CollisionShape2D2.set_deferred("disabled", false)
	

func turn_off():
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionPolygon2D.set_deferred("disabled", true)
	$Area2D.set_deferred("monitoring", false)
	$CollisionShape2D2.set_deferred("disabled", true)




signal stairs_entered(stairs)
signal stairs_exited
enum directions {Left, Right}
@export var direction: directions = directions.Left
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
		stairs_entered.emit(self)
		get_tree().root.get_node("main").change_to_floor(DestinationFloor, "StairsUp", stairs_id)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		stairs_exited.emit()
