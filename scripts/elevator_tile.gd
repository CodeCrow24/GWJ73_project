extends StaticBody2D


signal player_entered(elevator)
signal player_exited() # not properly inplemented

@export var elevator_id = 0

enum door_states {Closed, Open}
var door_state = door_states.Closed
var player_is_inside = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$CollisionShape2DFront.set_deferred("disabled", true)
	$CollisionShape2DDoorL.set_deferred("disabled", false)
	$CollisionShape2DDoorR.set_deferred("disabled", false)
	#$Sprite2D.z_index = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_is_inside:
		$Sprite2D.z_index = 9
	else:
		$Sprite2D.z_index = 0

func open():

	
	$AnimationTree.set("parameters/conditions/should_open", true)
	$AnimationTree.set("parameters/conditions/should_close", false)
	$Sprite2D.z_index = 0
	door_state = door_states.Open

	

func close():
	

	$AnimationTree.set("parameters/conditions/should_open", false)
	$AnimationTree.set("parameters/conditions/should_close", true)
	$Sprite2D.z_index = 0
	door_state = door_states.Closed
	
	


func close_with_player_inside():
	
	

	$AnimationTree.set("parameters/conditions/should_open", false)
	$AnimationTree.set("parameters/conditions/should_close", true)
	door_state = door_states.Closed

func open_with_player_inside():

	
	
	$AnimationTree.set("parameters/conditions/should_open", true)
	$AnimationTree.set("parameters/conditions/should_close", false)
	door_state = door_states.Open


func _on_player_nearby_detection_body_entered(body: Node2D) -> void:
	if body is Player:
		open()
	


func _on_player_nearby_detection_body_exited(body: Node2D) -> void:
	if body is Player:
		close()


func _on_player_in_elevator_detection_body_entered(body: Node2D) -> void:
	
	if body is Player:
		
		if door_state == door_states.Open and player_is_inside == false:
			player_is_inside = true
			close_with_player_inside()
			emit_signal("player_entered", self)
		player_is_inside = true

		




	


func _on_player_in_elevator_detection_body_exited(body: Node2D) -> void:
	
	if body is Player:
		player_is_inside = false
		emit_signal("player_exited")
