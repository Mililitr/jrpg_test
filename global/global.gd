extends Node

signal player_message_signal

#пути
var paths := {
	"player": "res://scenes/objects/player.tscn",
	"street": "res://scenes/maps/street.tscn",
	"house_inside": "res://scenes/maps/house_inside.tscn",
	"house_outside": "res://scenes/maps/house_outside.tscn"
}

#глобальные переменные
var player_hp = 5
var player_hp_max = 10
var player_keys = 0
var player_position: Vector2
var player_entered := false

var street_opened_houses := [false, false, false]
var house_state = 0

func player_hp_up(score):
	player_hp = min(player_hp + score, 10)

func player_hp_max_up(score):
	player_hp_max += score

func player_hp_max_down(score):
	player_hp_max = min(player_hp_max - score, 1)
