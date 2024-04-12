extends "res://Scripts/LifeHistory.gd"

@export var dice_cube : Control

func  _ready():
	player1.damage_signal.connect(add_history)
	player2.damage_signal.connect(add_history)
	dice_cube.damage_signal.connect(add_history)
