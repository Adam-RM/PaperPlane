extends Node2D

@export var Activated: bool = false
@export var KeyUsed: InputEventKey
@export var text: Label
var isActivated: bool = false

signal FanKeyPressedEvent
# Called when the node enters the scene tree for the first time.
func _ready():
	text.text = KeyUsed.as_text_keycode()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if (Input.is_key_pressed(KeyUsed.keycode)):
		if (isActivated == false):
			FanKeyPressedEvent.emit()
			Activated = !Activated
			isActivated = !isActivated
	else:
		if (isActivated == true):
			FanKeyPressedEvent.emit()
			Activated = !Activated
			isActivated = !isActivated
			

	

