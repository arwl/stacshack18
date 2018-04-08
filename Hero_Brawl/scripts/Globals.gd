extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# Default characters
var p1Char = "Ghost"
var p2Char = "Hulk"
var p3Char = "Fireboy"
var p4Char = "Bombman"

var numPlayers
var playersAlive = 4

# Functions to set the character values
func setP1Char(charName):
	p1Char = charName

func setP2Char(charName):
	p2Char = charName

func setP3Char(charName):
	p3Char = charName

func setP4Char(charName):
	p4Char = charName

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if (playersAlive == 1):
		print("winner winner")
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
