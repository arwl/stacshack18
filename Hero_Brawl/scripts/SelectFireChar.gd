extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

func _input_event(viewport, event, shape_idx):
	if (event.is_pressed()):
		match (get_node("../").name):
			"P1Select":
				global.setP1Char("Fireboy")
			"P2Select":
				global.setP2Char("Fireboy")
			"P3Select":
				global.setP3Char("Fireboy")
			"P4Select":
				global.setP4Char("Fireboy")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
