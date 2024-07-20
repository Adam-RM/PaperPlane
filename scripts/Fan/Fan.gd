class_name Fan

extends Node2D

@export var Activated: bool = false
@export var Wind2DSprite: AnimatedSprite2D
@export var Fan2DSprite: AnimatedSprite2D

var isActivated: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Fan2DSprite.pause()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_key_pressed(KEY_A)):
		if (isActivated == false):
			_fanActivation()
			Activated = true
			isActivated = true
	else:
		if (isActivated == true):
			_fanActivation()		
			Activated = false
			isActivated = false
	pass

func _fanActivation():
	Wind2DSprite.visible = not Wind2DSprite.visible
	if (Fan2DSprite.is_playing()):
		Fan2DSprite.pause()
	else:
		Fan2DSprite.play()

func _get_status():
	return Activated
