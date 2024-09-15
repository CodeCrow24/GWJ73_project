extends CharacterBody2D

const SPEED = 100
var player_state

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
		$anim.play("idle")
	elif player_state == "walk":
		if dir.y == -1 and dir.x == 0:
			$anim.play("n-walk")
		elif dir.y == 1 and dir.x == 0:
			$anim.play("s-walk")
		elif dir.x == -1 and dir.y == 0:
			$anim.play("w-walk")
		elif dir.x == 1 and dir.y == 0:
			$anim.play("e-walk")
		elif dir.y < -0.5 and dir.x > 0.5:
			$anim.play("ne-walk")
		elif dir.y > 0.5 and dir. x > 0.5:
			$anim.play("se-walk")
		elif dir.y > 0.5 and dir.x < -0.5:
			$anim.play("sw-walk")
		elif dir.y < -0.5 and dir.x < -0.5:
			$anim.play("nw-walk")
		
