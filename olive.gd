extends "res://scenes/objects/items/apple.gd"

func _on_interact_area_interact_signal():
	G.player_hp_max_down(10)
	queue_free()
