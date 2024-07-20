extends Node2D

var speed : float = 100.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Calculer le déplacement en fonction du temps écoulé
	var displacement = speed * delta
	# Mettre à jour la position de la node
	position.x += displacement
	pass
