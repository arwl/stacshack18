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
	
	var lh = Input.get_joy_axis(0, 0)
	var lv = Input.get_joy_axis(0, 1)
	if deadzone(lh, lv):
		force = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1)) * PlayerAccel
		
	var rotationVector
	rotationVector = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1))
	
	var rh = Input.get_joy_axis(0, 3)
	var rv = Input.get_joy_axis(0, 2)
	if deadzone(rh, rv):
		rotation = (atan2(rh, rv) + PI / 2)
	
	return force * delta
		
func deadzone(lr, ud):
	return (lr * lr + ud * ud) > 0.1
		
	
	
	
func attack():
	pass
	