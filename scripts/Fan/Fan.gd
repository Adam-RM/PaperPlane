class_name Fan

extends Node2D

var fanSprite = null
var windSprite = null
var status: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	fanSprite = get_node("Fan2DSprite") as AnimatedSprite2D
	windSprite = get_node("Wind2DSprite") as AnimatedSprite2D
	
	fanSprite.pause()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _fanActivation():
	status = !status
	windSprite.visible = not windSprite.visible
	if (fanSprite.is_playing()):
		fanSprite.pause()
	else:
		fanSprite.play()

func _get_status():
	return status
