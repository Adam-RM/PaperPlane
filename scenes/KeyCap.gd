extends Node2D

@export var Activated: bool = false
@export var KeyUsed: InputEventKey
@export var KeyCase2DSprite: Sprite2D
@export var text: Label
var isActivated: bool = false
var initScale: Vector2 = Vector2.ZERO

signal FanKeyPressedEvent
# Called when the node enters the scene tree for the first time.
func _ready():
	text.text = KeyUsed.as_text_keycode()
	initScale = KeyCase2DSprite.transform.get_scale()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if (Input.is_key_pressed(KeyUsed.keycode)):
		if (isActivated == false):
			FanKeyPressedEvent.emit()
			Activated = !Activated
			isActivated = !isActivated
			KeyCase2DSprite.scale = initScale * 0.9
	else:
		if (isActivated == true):
			FanKeyPressedEvent.emit()
			Activated = !Activated
			isActivated = !isActivated
			KeyCase2DSprite.scale = initScale * 1
			

	

