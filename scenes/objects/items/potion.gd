extends "res://scenes/objects/items/apple.gd"

func _on_interact_area_interact_signal():
	for i in len(G.street_opened_houses):
		print(i)
		G.street_opened_houses[i] = false
	for i in G.street_opened_houses:
		print(i)
	queue_free()
