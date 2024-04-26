extends CharacterBody2D

#переменные
const SPEED := 400.0

var input: Vector2
@export var interacts = []

#узлы
@onready var nodes := {
	"anime_sprite": $anime_sprite,
	"hp": $hud/stats/hp,
	"keys": $hud/stats/keys,
	"message": $hud/message,
	"message_label": $hud/message/label
}

func _ready():
	#сигналы
	G.player_message_signal.connect(message)
	
	#последняя позиция игрока вне двери
	if G.player_position != Vector2() and !G.player_entered:
		position = G.player_position

func _physics_process(_delta):
	#направление
	input = Input.get_vector("a", "d", "w", "s")
	
	#движение
	if input:
		velocity = input * SPEED
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
	#анимация спрайта
	match input:
		Vector2.RIGHT:
			nodes["anime_sprite"].play("right")
		Vector2.LEFT:
			nodes["anime_sprite"].play("left")
		Vector2.UP:
			nodes["anime_sprite"].play("up")
		Vector2.DOWN:
			nodes["anime_sprite"].play("idle")
	
	#анимация сообщения
	if nodes["message"].visible:
		nodes["message_label"].visible_ratio += 0.02

func _input(_event):
	#интеракт
	if Input.is_action_just_pressed("e"):
		if interacts:
			if interacts[0] is InteractDoor:
				interacts[0].interact(position)
			elif interacts[0] is InteractItem:
				interacts[0].interact()
		
		#скрытие сообщения
		elif nodes["message"].visible:
			nodes["message"].visible = false
			nodes["message_label"].visible_ratio = 0
	
	#вывод хп и кол ключей
	nodes["hp"].text = "HP " + str(G.player_hp) + "/" + str(G.player_hp_max)
	nodes["keys"].text = "Keys: " + str(G.player_keys)

#интеркат лист
func _on_interact_area_area_entered(area):
	interacts.insert(0, area)

func _on_interact_area_area_exited(area):
	interacts.erase(area)

#сообщение
func message(message):
	nodes["message_label"].text = message
	nodes["message"].visible = true
