extends Node2D

@onready var animation = $AnimationPlayer
@export var level_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func closing():
	animation.play("closing_door")
	
func isClosed():
	print("End Level !!")
	SceneSwitcher.switch_scene(level_name)


func _on_area_2d_body_entered(body):
	if body is PaperPlane:
		closing()
