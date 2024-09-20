extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@export var mu_static:float = 60  # friction coefficients
@export var mu_moving:float = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.linear_velocity.length() == 0:
		self.add_force_for_frame(- self.mass * mu_static * self.linear_velocity.normalized())
	else:
		self.add_force_for_frame(- self.mass * mu_moving * self.linear_velocity.normalized())

var applied_forces: Vector2 = Vector2(0, 0)

func add_force_for_frame(force: Vector2):
	# add_force adds a permanent force, for a temporary one we need to wipe it
	# by undo the force next frame, just keep track of forces applied
	applied_forces += force
	#self.apply_central_force(force)
