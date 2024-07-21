extends Node2D

@export var KeyUsed: InputEventKey
@export var fan: Fan
var isActivated: bool = false
var initScale: Vector2 = Vector2.ZERO

signal FanKeyPressedEvent

var sprite = null

func _ready():
	var label = get_node("Label") as Label
	label.text = KeyUsed.as_text_keycode()
	sprite = get_node("Sprite2D") as Sprite2D
	initScale = sprite.transform.get_scale()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_key_pressed(KeyUsed.keycode)):
		if (isActivated == false):
			fan._fanActivation()
			isActivated = !isActivated
			sprite.scale = initScale * 0.9
	else:
		if (isActivated == true):
			fan._fanActivation()
			isActivated = !isActivated
			sprite.scale = initScale * 1
