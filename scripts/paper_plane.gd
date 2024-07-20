extends CharacterBody2D



class_name PaperPlane

const SPEED = 300.0
const INIT_VELOCITY = Vector2(400, 0)
const INIT_GRAVITY = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	velocity = INIT_VELOCITY
	gravity = INIT_GRAVITY

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	update_rotation()
	move_and_slide()
	
func update_rotation():
	# Vérifier que la vélocité n'est pas zéro pour éviter une division par zéro
	if velocity.length() > 0:
		# Calculer l'angle de rotation en radians
		var angle = velocity.angle()
		
		# Appliquer l'angle au sprite
		rotation = angle
		
		# Facultatif : afficher l'angle pour le débogage
		print("Angle de rotation : ", rad_to_deg(angle), " degrés")

func print_name():
	print("patates")
	print(self.name)
