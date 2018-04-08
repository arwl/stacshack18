extends "res://scripts/PlayerKinematicBody.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func special():
	get_node("./special").play(0)
	timeOfLastSpecial = OS.get_ticks_msec()
	
	var fireballScene = load("res://_scenes/Fireball.tscn")
	var fireball = fireballScene.instance()
	fireball.direction = -1 * Vector2(-sin(rotation), cos(rotation))
	fireball.position = position + fireball.direction * 20

	get_node('.').get_parent().add_child(fireball)
