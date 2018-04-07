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
	place_players(4, 120, 600)
	#place_walls(20)
	place_wall_length(20, 20, 3, "h")
	

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
	for x in range(boardSize/wallSize):
		# walls along top and bottom
		place_wall((x*(wallSize))+132, 108, "ext")
		place_wall((x*(wallSize))+132, 612, "ext")
		# walls along left and right
		place_wall(108, (x*(wallSize))+132, "ext")
		place_wall(612, (x*(wallSize))+132, "ext")
		
	

func place_wall_length(x, y, length, hOrV):
	x += 120
	y += 120
	for x in range (length):
		place_wall(x, y, "obstacle")
		if (hOrV == "h"):
			x += 24
		else:
			y += 24

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
		place_wall(rand_range(128, 600), rand_range(128,600), "obstacle")
		#place_wall(randi()%468+128, randi()%468+128, "obstacle")