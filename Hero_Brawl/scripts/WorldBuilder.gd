extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	setup_board()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func setup_board():
	place_walls(200)
	#set_process(true)
	#set_process_input(true)
	
func place_wall(x, y):
	var wallScene = load("res://Wall.tscn")
	var wall = wallScene.instance()
	wall.translate(Vector2(x,y))
	get_node(".").call_deferred("add_child", wall)
	
func place_walls(numWalls):
	for x in range (numWalls):
		place_wall(randi()%468+128, randi()%468+128)