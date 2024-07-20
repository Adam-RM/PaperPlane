extends CharacterBody2D

class_name PaperPlane

const SPEED = 300.0
const INIT_VELOCITY = 400.0
const INIT_GRAVITY = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	velocity.x = INIT_VELOCITY
	gravity = INIT_GRAVITY

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
func print_name():
	print("patates")
	print(self.name)
