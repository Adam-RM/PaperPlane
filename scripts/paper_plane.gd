extends CharacterBody2D



class_name PaperPlane

const SPEED = 300.0
const INIT_VELOCITY = Vector2(300, 0)
const INIT_GRAVITY = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed_accel = 0.03

func _ready():
	velocity = INIT_VELOCITY
	gravity = INIT_GRAVITY

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	update_rotation()
	var speed_ratio = rotation_to_speed_ratio()
	velocity += velocity * speed_ratio
	move_and_slide()
	
func update_rotation():
	# Vérifier que la vélocité n'est pas zéro pour éviter une division par zéro
	if velocity.length() > 0:
		# Calculer l'angle de rotation en radians
		var angle = velocity.angle()
		
		# Appliquer l'angle au sprite
		rotation = angle

# Fonction pour convertir une rotation en ratio de vitesse
func rotation_to_speed_ratio() -> float:
	var angle = velocity.angle()
	var ratio = sin(angle) * speed_accel
	return ratio

func add_force(force: Vector2):
	var global_force = global_transform.basis_xform(force)
	velocity += force
