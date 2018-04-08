extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var direction = Vector2()
var speed = 2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	translate(direction * speed)

	for collider in get_node("Area2D").get_overlapping_bodies():
		if 	(collider.is_in_group("Wall")):
			queue_free()
		if 	(collider.is_in_group("Heroes")):
			queue_free()
			collider.hit(direction, 5, 25)
	
