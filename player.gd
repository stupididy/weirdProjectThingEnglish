extends KinematicBody

var camera
var is_dragging = false

func _ready():
    camera = get_node("Path/To/Your/CameraNode") # Replace with the path to your camera node
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
    if event is InputEventMouseButton: 
        if event.button_index == BUTTON_RIGHT and event.pressed:
            is_dragging = true
            Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

    if event is InputEventMouseMotion and is_dragging:
        camera.rotate_y(-event.relative.x * 0.01)
        camera.rotate_x(-event.relative.y * 0.01)

    if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and not event.pressed:
        is_dragging = false
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)