extends KinematicBody2D

# Members
export var PlayerAccel = 100
export var PlayerAccelDrag = 0.5
export var PlayerTurn = 0.1
export var PlayerTurnDrag = 0.1

export var speed = 50

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
	move_and_collide(joyMotion(delta))
	
func joyMotion(delta):
	var force = Vector2(0,0)
	
	if Input.get_joy_axis(0, 0) != 0 && Input.get_joy_axis(0, 1) != 0:
		force = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1)) * PlayerAccel
		
	var rotationVector
	rotationVector = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1))
	
	rotation = -(atan2(Input.get_joy_axis(0, 2), Input.get_joy_axis(0, 3)))
	
	return force * delta
		
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
	