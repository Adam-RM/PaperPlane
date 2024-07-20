extends Area2D

@export var fan: Fan
var direction = Vector2.ZERO

var PlayerOnPath: bool = false

var player_body: PaperPlane

var strength = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerOnPath == true :
		if (fan._get_status() == true):
		#	direction = Vector2(-cos(get_parent().rotation), sin(get_parent().rotation)).normalized()
			direction = Vector2(sin(get_parent().rotation), -cos(get_parent().rotation)).normalized()
			player_body.add_force(direction * strength * delta)
			

func _on_body_entered(body):
	if body is PaperPlane:
		player_body = body
		PlayerOnPath = true

func _on_body_exited(body):
	print("exited")
	if body is PaperPlane:
		print("it's all good")
		PlayerOnPath = false
