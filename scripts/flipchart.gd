extends Node2D

var player_close = false


var dynImage = Image.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	dynImage = Image.create_empty(25,32,false,4)
	dynImage.fill(Color(1,1,1))
	
	update_texture()
	
func update_texture():
	$Canvas.texture = ImageTexture.create_from_image(dynImage)

func _process(_delta):
	if player_close:
		$animation.play("player_close")
	else:
		$animation.play("player_not_close")




func _input(_event):
	if Input.is_action_just_pressed("interact"):
		if player_close:
			if Global.flipchart_shown and !Global.flipcharttrans:
				get_tree().root.get_node("main/GUI").hide_flipchart()
				Global.flipchart_shown = false
				Global.flipcharttrans = true
			elif !Global.flipchart_shown and !Global.flipcharttrans:
				get_tree().root.get_node("main/GUI").show_flipchart(self)
				Global.flipchart_shown = true
				Global.flipcharttrans = true

func _on_interaction_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_close = true


func _on_interaction_zone_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_close = false
		update_texture()
		if Global.flipchart_shown:
			get_tree().root.get_node("main/GUI").hide_flipchart()
			Global.flipchart_shown = false


func turn_off():
	$interaction_zone.set_deferred("monitoring", false)
	$flipchart_collisions/flipchart_hitbox.set_deferred("disabled", true)
	
func turn_on():
	$interaction_zone.set_deferred("monitoring", true)
	$flipchart_collisions/flipchart_hitbox.set_deferred("disabled", false)
