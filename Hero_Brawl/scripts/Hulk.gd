extends "res://scripts/PlayerKinematicBody.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var greenFist
#onready var sprite = get_node("PlayerSprite")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	greenFist = get_node("Greenfist")
	greenFist.hide()

func _process(delta):
	if (OS.get_ticks_msec() - timeOfLastSpecial > SpecialCooldown):
		greenFist.hide()

func special():
	timeOfLastSpecial = OS.get_ticks_msec()
	greenFist.show()
	for collider in get_node("MeleeAoE").get_overlapping_bodies():
		if 	(collider.is_in_group("Heroes")):
			collider.hit(Vector2(sin(rotation), cos(rotation)), Knockback, 40)
		if 	(collider.is_in_group("Wall") && !collider.is_in_group("ExtWall")):
			collider.get_parent().get_parent().queue_free()
	