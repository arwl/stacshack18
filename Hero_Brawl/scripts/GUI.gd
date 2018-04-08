extends MarginContainer

#onready var bar = $Bars/LifeBar/TextureProgress
onready var bar = get_node("./HPBar")
onready var tween = $Tween

var animated_health = 1

func _ready():
	var player_max_health = 100
	bar.max_value = player_max_health
	update_health(player_max_health)


func _on_Player_health_changed(player_health):
	update_health(player_health)


func update_health(new_value):
	tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()


func _process(delta):
	var round_value = round(animated_health)
	bar.value = round_value


func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)

func _on_KinematicBody2D_health_changed():
	pass # replace with function body
