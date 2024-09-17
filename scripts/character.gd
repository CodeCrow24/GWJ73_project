extends CharacterBody2D


class_name Player


@export var SPEED = 50
var player_state
var last_dir = "s-idle"



func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walk"
	
	velocity = direction * SPEED
	move_and_slide()
	
	play_animation(direction)
	
func play_animation(dir):
	if player_state== "idle":
		$anim.play(last_dir)
	elif player_state == "walk":
		if dir.y == -1 and dir.x == 0:
			$anim.play("n-walk")
			last_dir = "n-idle"
		elif dir.y == 1 and dir.x == 0:
			$anim.play("s-walk")
			last_dir = "s-idle"
		elif dir.x == -1 and dir.y == 0:
			$anim.play("w-walk")
			last_dir = "w-idle"
		elif dir.x == 1 and dir.y == 0:
			$anim.play("e-walk")
			last_dir = "e-idle"
		

func _input(event):
	if Input.is_action_just_pressed("mouse_right"):
		position = get_global_mouse_position()
