extends Node2D

@onready var nodes = {
	"house1": $house1,
	"house2": $house2,
	"house3": $house3
}

#открывание дверей
func _ready():
	if G.street_opened_houses[0]:
		nodes["house1"].open_door()
	if G.street_opened_houses[1]:
		nodes["house2"].open_door()
	if G.street_opened_houses[2]:
		nodes["house3"].open_door()

#передача открытых дверей
func _on_house_1_door_opened():
	G.street_opened_houses[0] = true

func _on_house_2_door_opened():
	G.street_opened_houses[1] = true

func _on_house_3_door_opened():
	G.street_opened_houses[2] = true
