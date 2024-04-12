extends Button

@export var player1 : Control
@export var player2 : Control

var history_array = []

func  _ready():
	player1.damage_signal.connect(add_history)
	player2.damage_signal.connect(add_history)

func add_history(value_player, value_hp):
	if value_hp != 0:
		history_array.push_front([value_player, value_hp])

func clear_history():
	history_array.clear()

func step_back():
	if history_array.size() > 0:
		var hp = history_array[0][1]
		history_array[0][0].step_back(hp)
		history_array.remove_at(0)

