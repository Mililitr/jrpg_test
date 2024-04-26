extends StaticBody2D

signal door_opened

enum State{
	EMPTY,
	FULL_OPEN,
	FULL_CLOSE
}

@export var current_state = State.EMPTY

func _ready():
	#сигналы
	$door_area.interact_signal.connect(on_interact)

#при интеракте изменение сцены
func on_interact(_player_position):
	if current_state != State.EMPTY:
		if current_state == State.FULL_CLOSE and G.player_keys > 0 and $anime_sprite.animation == "close":
			change_scene(_player_position)
			G.player_keys -= 1
		elif $anime_sprite.animation == "open":
			change_scene(_player_position)
		elif current_state == State.FULL_OPEN:
			change_scene(_player_position)
		else:
			G.player_message_signal.emit("Дверь закрыта")

func change_scene(_player_position):
	get_tree().change_scene_to_file(G.paths["house_inside"])
	G.house_state = current_state
	G.player_position = _player_position
	G.player_entered = true
	door_opened.emit()

func open_door():
	$anime_sprite.play("open")
