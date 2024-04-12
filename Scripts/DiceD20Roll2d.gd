extends "res://Scripts/BaseDice.gd"

@export var animated_sprite : AnimatedSprite2D

@export var min_roll_time = 0.5
@export var max_roll_time = 2.0

var _value = 0 
var _old_value = 0

signal damage_signal

var add_timer = Timer.new()

func _ready():
	init_timer()
	reset()
	finish_roll()

func roll(value : int):
	_old_value = _value
	_value = value
	animated_sprite.play("roll") 
	add_timer.start(randf_range(min_roll_time, max_roll_time))

func init_timer():
	add_timer.connect("timeout", Callable(self, "finish_roll"))
	add_timer.set_one_shot(true)
	add_timer.set_wait_time(1.0)
	add_child(add_timer)

func step_back(value):
	_value = value
	animated_sprite.play("r"+str(_value)) 

func reset():
	_value = 1
	_old_value = _value
	finish_roll()

func finish_roll():
	emit_signal("damage_signal", self, _old_value)
	animated_sprite.play("r"+str(_value)) 
