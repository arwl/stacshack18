extends "res://scripts/PlayerKinematicBody.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	SpecialCooldown = 4000
	SpecialLength = 2000
	pass
	
func special():
	get_node("./special").play(0)
	timeOfLastSpecial = OS.get_ticks_msec()
	for thing in get_node(".").get_parent().get_parent().get_children():
		for thing2 in thing.get_children():
			for thing3 in thing2.get_children():
				if (thing3.is_in_group("Wall") && !thing3.is_in_group("ExtWall")):
					add_collision_exception_with(thing3)
	

func _process(delta):
	if (OS.get_ticks_msec() - timeOfLastSpecial > SpecialLength):
		for thing in get_node(".").get_parent().get_parent().get_children():
			for thing2 in thing.get_children():
				for thing3 in thing2.get_children():
					if (thing3.is_in_group("Wall") && !thing3.is_in_group("ExtWall")):
						remove_collision_exception_with(thing3)
