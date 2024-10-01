extends Control

@export var load_scene : PackedScene
@export var logo_pause_time : float = 0.5
@export var fade_in_time : float = 1
@export var pause_time : float = 1.5
@export var fade_out_time : float = 1
@export var godot_splash : TextureRect
@export var gwj_splash : TextureRect
@export var codecrow_splash : TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	fade()


func fade():
	godot_splash.modulate.a = 0.0
	gwj_splash.modulate.a = 0.0
	codecrow_splash.modulate.a = 0.0
	var tween = self.create_tween()
	tween.tween_interval(logo_pause_time)
	tween.tween_property(godot_splash, "modulate:a",1.0, fade_in_time)
	tween.tween_interval(pause_time)
	tween.tween_property(godot_splash, "modulate:a", 0.0, fade_out_time)
	tween.tween_interval(logo_pause_time)
	tween.tween_property(gwj_splash, "modulate:a",1.0, fade_in_time)
	tween.tween_interval(pause_time)
	tween.tween_property(gwj_splash, "modulate:a", 0.0, fade_out_time)
	tween.tween_interval(logo_pause_time)
	tween.tween_property(codecrow_splash, "modulate:a",1.0, fade_in_time)
	tween.tween_interval(pause_time)
	tween.tween_property(codecrow_splash, "modulate:a", 0.0, fade_out_time)
	tween.tween_interval(logo_pause_time)
	
	await tween.finished
	get_tree().change_scene_to_packed(load_scene)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
