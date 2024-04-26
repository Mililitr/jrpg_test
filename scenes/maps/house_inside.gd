extends StaticBody2D

func _ready():
	#сигналы
	%door_area.interact_signal.connect(on_interact)
	
	if G.house_state > 0:
		var interior = preload("res://scenes/objects/interior.tscn")
		add_child(interior.instantiate())

#при интеракте изменение сцены
func on_interact(_player_position):
	get_tree().change_scene_to_file(G.paths["street"])
	G.player_entered = false
