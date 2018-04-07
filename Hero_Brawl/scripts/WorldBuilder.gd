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
	#loac_map("meadow")
	place_ext_walls(480, 24)
	place_players(1, 120, 600)
	#place_walls(64)
	#place_wall_length(20, 20, 3, "h")
	place_random_wall_lengths(16, 16)
	

func load_map(mapName):
	var mapScene = load("res://_scenes/" + mapName + ".tscn")
	var map = mapScene.instance()
	map.translate(Vector2(0,0))
	get_node(".").call_deferred("add_child", map)
	

func place_players(numPlayers, leftEdge, rightEdge):
	# number of players should be between 1 and 4
	match (numPlayers):
		4:
			place_player(rightEdge-40, rightEdge-40, "Hulk")
			place_player(leftEdge+40, rightEdge-40, "Ghost")
			place_player(rightEdge-40, leftEdge+40, "Bombman")
			place_player(leftEdge+40, leftEdge+40, "Fireboy")
		3:
			place_player(leftEdge+40, rightEdge-40, "Player")
			place_player(rightEdge-40, leftEdge+40, "Player")
			place_player(leftEdge+40, leftEdge+40, "Player")
		2:
			place_player(rightEdge-40, leftEdge+40, "Player")
			place_player(leftEdge+40, rightEdge-40, "Player")
		1:
			place_player(leftEdge+40, leftEdge+40, "Hulk")
		_:
			print("invalid number of players. should be between 1 and 4")

func place_player(x, y, character):
	var playerScene = load("res://_scenes/" + character + ".tscn")
	var player = playerScene.instance()
	player.translate(Vector2(x,y))
	get_node(".").call_deferred("add_child", player)

func place_ext_walls(boardSize, wallSize):
	for x in range((boardSize/wallSize) + 2):
		# walls along top and bottom
		place_wall((x*(wallSize))+108, 108, "ext")
		place_wall((x*(wallSize))+108, 612, "ext")
		# walls along left and right
		place_wall(108, (x*(wallSize))+108, "ext")
		place_wall(612, (x*(wallSize))+108, "ext")

func place_random_wall_lengths(numHWalls, numVWalls):
	var length
	var x
	var y
	# Make horizontal walls
	for i in range (numHWalls):
		randomize()
		length = rand_range(1,4)
		x = rand_range(180, 540)
		y = rand_range(180, 588)
		place_wall_length(x,y,length, "h")
	# Make vertical walls
	for i in range (numVWalls):
		randomize()
		length = rand_range(1,5)
		x = rand_range(180, 588)
		y = rand_range(180, 420)
		place_wall_length(x,y,length, "v")

func place_wall_length(x, y, length, hOrV):
	#x += 120
	#y += 120
	print(x, y)
	for i in range (length):
		place_wall(x, y, "obstacle")
		if (hOrV == "h"):
			x += 22
		else:
			y += 22

func place_wall(x, y, type):
	var wallScene
	match (type):
		"obstacle":
			wallScene = load("res://_scenes/Wall.tscn")
		"ext":
			wallScene = load("res://_scenes/ExtWall.tscn")
	var wall = wallScene.instance()
	wall.translate(Vector2(x,y))
	get_node(".").call_deferred("add_child", wall)

func place_walls(numWalls):
	for x in range (numWalls):
		randomize()
		place_wall(rand_range(128, 592), rand_range(128,592), "obstacle")
		#place_wall(randi()%468+128, randi()%468+128, "obstacle")