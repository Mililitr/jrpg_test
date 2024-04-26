class_name InteractItem extends Area2D

signal interact_signal

func interact():
	emit_signal("interact_signal")
