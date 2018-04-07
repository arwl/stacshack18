extends RigidBody2D

# Members
var velocity = Vector2()

export var PlayerAccel = 100

onready var sprite = get_node("PlayerSprite")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):

		
	if Input.is_key_pressed(KEY_RIGHT):
		velocity = Vector2(PlayerAccel, 0)
	elif Input.is_key_pressed(KEY_LEFT):
		velocity = Vector2(-PlayerAccel, 0)
	elif Input.is_key_pressed(KEY_UP):
		velocity = Vector2(0, -PlayerAccel)
	elif Input.is_key_pressed(KEY_DOWN):
		velocity = Vector2(0, PlayerAccel)
	
	
	var motion = velocity * delta
	add_force(Vector2(0, 0), motion)