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
	place_ext_walls(480, 24)
	place_players(1)
	place_walls(20)
	

func place_players(numPlayers):
	place_player(560, 560)

func place_player(x, y):
	var playerScene = load("res://_scenes/Player.tscn")
	var player = playerScene.instance()
	player.translate(Vector2(x,y))
	get_node(".").call_deferred("add_child", player)

func place_ext_walls(boardSize, wallSize):
	for x in range(boardSize/wallSize):
		# walls along top and bottom
		place_wall((x*(wallSize))+132, 108)
		place_wall((x*(wallSize))+132, 612)
		# walls along left and right
		place_wall(108, (x*(wallSize))+132)
		place_wall(612, (x*(wallSize))+132)
		
	

#func place_length_wall(x, y, length, horv):

func place_wall(x, y):
	var wallScene = load("res://_scenes/Wall.tscn")
	var wall = wallScene.instance()
	wall.translate(Vector2(x,y))
	get_node(".").call_deferred("add_child", wall)
	
func place_walls(numWalls):
	for x in range (numWalls):
		place_wall(randi()%468+128, randi()%468+128)