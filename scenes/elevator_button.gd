extends Control


enum ButtonStates {Normal, Unlocked, Next, Locked}
enum ButtonDisplayType {Number, Symbol}
@export var ButtonState: ButtonStates
@export var Symbol = "0"

@export var DestinationFloor: String
@export var OtherAction: String
signal open_doors

var SymbolFrameMapping = {
	"1": 0,
	"2": 1,
	"3": 2,
	"4": 3,
	"5": 4,
	"6": 5,
	"7": 6,
	"8": 7,
	"9": 8,
	"0": 9,
	"Open": 10, 
	"Close": 11,
	"Alarm": 12,
	"Locked": 13
}




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateButton()
	
func updateButton():
	if SymbolFrameMapping.get(Symbol) != null:
		$Symbol.frame = SymbolFrameMapping.get(Symbol)
	if ButtonState == ButtonStates.Normal:
		$Sprite2D.frame_coords.y = 0
	elif ButtonState == ButtonStates.Unlocked:
		$Sprite2D.frame_coords.y = 1
	elif ButtonState == ButtonStates.Next:
		$Sprite2D.frame_coords.y = 2
	elif ButtonState == ButtonStates.Locked:
		$Sprite2D.frame_coords.y = 3
		$Symbol.frame = 13

func _on_button_button_down() -> void:
	$Sprite2D.frame_coords.x = 1
	$Symbol.position.y += 1


func _on_button_button_up() -> void:
	$Sprite2D.frame_coords.x = 0
	$Symbol.position.y -= 1
	if DestinationFloor != null and ButtonState != ButtonStates.Locked:
		
		if FloorManager.current_floor == DestinationFloor:
			emit_signal("open_doors")
		else:
			FloorManager.go_to_floor(DestinationFloor)
	
		
	if OtherAction != null and ButtonState != ButtonStates.Locked:
		match OtherAction:
			"Open Doors":
				
				emit_signal("open_doors")
