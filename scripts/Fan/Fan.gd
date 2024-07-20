class_name Fan

extends Node2D

@export var Activated: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_key_pressed(KEY_A)):
		#print("try to activate")
		Activated = true
	else:
		Activated = false
	pass

func _get_status():
	return Activated
