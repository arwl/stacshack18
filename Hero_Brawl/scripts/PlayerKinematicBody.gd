extends KinematicBody2D

# Members
export var speed = 100
export var health = 100
export var MeleeCooldown = 250
export var Knockback = 15
export var Damage = 20

var timeOfLastMelee = 0
export var PlayerNo = 0

onready var fist
#onready var sprite = get_node("PlayerSprite")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	fist = get_node("Fist")
	fist.hide()
	set_process(true)

func _process(delta):
	if (OS.get_ticks_msec() - timeOfLastMelee > MeleeCooldown):
		fist.hide()

	motion(delta)
	if Input.is_joy_button_pressed(PlayerNo, 5) && OS.get_ticks_msec() - timeOfLastMelee > MeleeCooldown:
		attack()

	if (health <= 0):
		get_node(".").get_parent().remove_child(get_node("."))
		global.playersAlive -= 1
		print("ded")


func motion(delta):
	move_and_collide(joyMotion(delta))

func joyMotion(delta):
	var force = Vector2(0,0)

	var lh = Input.get_joy_axis(PlayerNo, 0)
	var lv = Input.get_joy_axis(PlayerNo, 1)
	if deadzone(lh, lv):
		force = Vector2(Input.get_joy_axis(PlayerNo, 0), Input.get_joy_axis(PlayerNo, 1)) * speed

	var rotationVector
	rotationVector = Vector2(Input.get_joy_axis(PlayerNo, 0), Input.get_joy_axis(PlayerNo, 1))

	var rh = Input.get_joy_axis(PlayerNo, 3)
	var rv = Input.get_joy_axis(PlayerNo, 2)
	if deadzone(rh, rv):
		rotation = (atan2(rh, rv) + PI / 2)

	return force * delta

func deadzone(lr, ud):
	return (lr * lr + ud * ud) > 0.1

func attack():
	fist.show()
	timeOfLastMelee = OS.get_ticks_msec()
	for collider in get_node("MeleeAoE").get_overlapping_bodies():
		if 	(collider.is_in_group("Heroes")):
			collider.hit(Vector2(sin(rotation), cos(rotation)), Knockback, Damage)

func hit(direction, knockback, damage):
	move_and_collide(direction * knockback)
	health -= damage

func set_player_no(playerNo):
	PlayerNo = playerNo

func special():
	pass
