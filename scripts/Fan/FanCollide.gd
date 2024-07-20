extends Area2D

@export var fan: Fan
var direction = Vector2.ZERO

var PlayerOnPath: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerOnPath == true :
		if (fan._get_status() == true):
			direction = Vector2(cos(get_parent().rotation), sin(get_parent().rotation))
			print(direction)
			print("FIOOUUUUU")

func _on_area_entered(area):
	PlayerOnPath = true

func _on_area_exited(area):
	PlayerOnPath = false
