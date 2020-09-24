extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var camera_position = Vector2(0,1000)
var dragstart = Vector2()
var drag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = camera_position
	set_process_unhandled_input(true)

func _unhandled_input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		dragstart = get_global_mouse_position()
		drag = true
		
	if drag and not Input.is_mouse_button_pressed(BUTTON_RIGHT):
		drag = false
		dragstart = Vector2()
	
	if drag and event is InputEventMouseMotion:
#		print("Moving camera")
		translate(dragstart - get_global_mouse_position())
		dragstart = get_global_mouse_position()

