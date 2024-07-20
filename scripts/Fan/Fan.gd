class_name Fan

extends Node2D

@export var FanActivateStatus: bool = false
@export var Wind2DSprite: AnimatedSprite2D
@export var Fan2DSprite: AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func _ready():
	print("past")
	Fan2DSprite.pause()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func _fanActivation():
	Wind2DSprite.visible = not Wind2DSprite.visible
	if (Fan2DSprite.is_playing()):
		Fan2DSprite.pause()
	else:
		Fan2DSprite.play()

func _get_status():
	return FanActivateStatus


func _on_key_cap_fan_key_pressed_event():
	_fanActivation()
	FanActivateStatus = !FanActivateStatus
	pass # Replace with function body.
