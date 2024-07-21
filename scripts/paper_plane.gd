extends CharacterBody2D

class_name PaperPlane


const SPEED = 300.0
const INIT_VELOCITY = Vector2(300, 0)
const INIT_GRAVITY = 50


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed_accel = 0.03

var plane_sprite: Sprite2D
var plane_crash_texture: Texture

func _ready():
	plane_sprite = $Plane
	velocity = INIT_VELOCITY
	gravity = INIT_GRAVITY
	plane_crash_texture = load("res://assets/sprites/crashed_plane.png")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	update_rotation()
	var speed_ratio = rotation_to_speed_ratio()
	velocity += velocity * speed_ratio
	if (velocity.x < 0 && plane_sprite.scale.y > 0):
		print("gauche")
		plane_sprite.scale.y *= -1
	elif (velocity.x > 0 && plane_sprite.scale.y < 0):
		print("droit")
		plane_sprite.scale.y *= -1
		
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("Wall"):
			print("I collided with ", collision.get_collider().name)
			velocity = Vector2(2, 0)
			plane_sprite.texture = plane_crash_texture
	
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
