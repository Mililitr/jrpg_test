class_name InteractDoor extends Area2D

signal interact_signal

func interact(player_position):
	emit_signal("interact_signal", player_position)
