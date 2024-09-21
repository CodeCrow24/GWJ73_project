extends Button


var color_frame_mapping = {
	Color(0.902, 0.271, 0.244): 0, # Red
	Color(0.388, 0.671, 0.247): 1, # Green
	Color(0.31, 0.643, 0.722): 2, # Blue
	Color(0.941, 0.71, 0.255): 3, # Yellow
	Color(0,0,0,1): 4, # Black
	Color(1,1,1,1): 5, # White
}
@export var button_color = Color("e64539")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if color_frame_mapping.get(button_color) != null:
		$Colorselectoptions.frame_coords.x = color_frame_mapping.get(button_color)
	else:
		$Colorselectoptions.frame_coords.x = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_up() -> void:
	$Colorselectoptions.frame_coords.y = 0
	
	get_parent().get_parent().current_color = button_color


func _on_button_down() -> void:
	$Colorselectoptions.frame_coords.y = 1
