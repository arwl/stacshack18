extends "res://scripts/PlayerKinematicBody.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	special()
	pass

var old_shape = null

func special():
	old_shape = get_node('./CollisionShape2D')
	get_node(".").remove_child(get_node("./CollisionShape2D"))
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
