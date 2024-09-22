extends Control

var current_flipchart = null
var dynImage = Image.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	dynImage = Image.create_empty(25,32,false,4)
	dynImage.fill(Color(1,1,1))
	$Canvas.texture = ImageTexture.create_from_image(dynImage)

func update_texture():
	$Canvas.texture = ImageTexture.create_from_image(dynImage)

var current_color = Color(0,0,0,1)

func _process(delta: float) -> void:
	if mouse_pressed:
		
		var cx = ($Canvas.texture.get_width() * $Canvas.scale.x)/2
		var cy = ($Canvas.texture.get_height() * $Canvas.scale.y)/2
		var temp = (mouse_pos - $Canvas.global_position + Vector2(cx,cy))/9
		if temp.x > 0 and temp.x < 25 and temp.y > 0 and temp.y < 35: 
			dynImage.set_pixel(int(temp.x),int(temp.y), current_color)
			update_texture()

var mouse_pressed = false
var mouse_pos = Vector2(0,0)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		mouse_pressed = event.pressed
		mouse_pos = event.position
	elif event is InputEventMouseMotion and mouse_pressed:
		mouse_pos = event.position 

func show_flipchart(flipchart):
	current_flipchart = flipchart
	visible = true
	
	dynImage = flipchart.dynImage
	update_texture()
	

func hide_flipchart():
	if current_flipchart != null:
		current_flipchart.update_texture()
	#visible = false
