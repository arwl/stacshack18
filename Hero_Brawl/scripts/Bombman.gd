extends "res://scripts/PlayerKinematicBody.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
func _ready():
	SpecialCooldown = 3000
	SpecialLength = 1000

func _process(delta):
	if (OS.get_ticks_msec() - timeOfLastSpecial > SpecialLength):
		speed = 100

func special():
	timeOfLastSpecial = OS.get_ticks_msec()
	speed = 200
	
	
