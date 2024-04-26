extends "res://scenes/objects/items/item.gd"

func _on_interact_area_interact_signal():
	G.player_hp_up(1)
	queue_free()
