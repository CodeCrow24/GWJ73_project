extends Node2D


func turn_on():
	$PlayerCheck.set_deferred("monitoring", true)
	$CautionWetSign/CollisionShape2D.set_deferred("disabled", false)
	$CautionWetSign2/CollisionShape2D.set_deferred("disabled", false)

func turn_off():
	$PlayerCheck.set_deferred("monitoring",false)
	$CautionWetSign/CollisionShape2D.set_deferred("disabled", true)
	$CautionWetSign2/CollisionShape2D.set_deferred("disabled", true)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_player_check_body_entered(body: Node2D) -> void:
	if body is Player:
		body.ice_areas.append(self)


func _on_player_check_body_exited(body: Node2D) -> void:
	if body is Player:
		body.ice_areas.erase(self)
