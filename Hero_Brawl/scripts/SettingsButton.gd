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
		print("settings")
		get_tree().change_scene("res://_scenes/SettingsMenu.tscn")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
