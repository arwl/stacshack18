extends RigidBody2D

# Members
export var PlayerAccel = 100
export var PlayerAccelDrag = 0.5
export var PlayerTurn = 0.1
export var PlayerTurnDrag = 0.1

export var health = 100

onready var sprite = get_node("PlayerSprite")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	
	motion(delta)
	if Input.is_action_just_pressed("Attack"):
		attack()
		
	
func motion(delta):	
	apply_impulse(Vector2(0, 0), keyboardMotion(delta))
	
func joyMotion(delta):
	var force = Vector2(0,0)
	
	if Input.get_joy_axis(0, 7) > 0:
		force = Vector2(cos(rotation), sin(rotation)) * PlayerAccel
		
	var turn = 0
	if Input.get_joy_axis(0, 0) != 0:
		set_angular_velocity(get_angular_velocity() + Input.get_joy_axis(0, 0) * PlayerTurn)
	else:
		set_angular_velocity(get_angular_velocity() * PlayerTurnDrag)
	
	var motion = force * delta
	
	return motion
	
func keyboardMotion(delta):
	var force = Vector2(0,0)
	
	if Input.is_key_pressed(KEY_RIGHT):
		force = Vector2(PlayerAccel, 0)
	elif Input.is_key_pressed(KEY_LEFT):
		force = Vector2(-PlayerAccel, 0)
	elif Input.is_key_pressed(KEY_UP):
		force = Vector2(0, -PlayerAccel)
	elif Input.is_key_pressed(KEY_DOWN):
		force = Vector2(0, PlayerAccel)
	else:
		force = Vector2(0, 0)
	var motion = force * delta
	
	return motion
	
func attack():
	pass
	