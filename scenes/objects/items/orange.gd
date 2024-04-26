extends "res://scenes/objects/items/apple.gd"

func _on_interact_area_interact_signal():
	G.player_hp_up(1)
	G.player_hp_max_up(1)
	queue_free()
