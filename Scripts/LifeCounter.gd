extends Control

var hp : int
var hp_temp : int
var hide_tween : Tween

@export var hp_default = 20
@export var hp_sum_obj : Button
@export var hp_obj : Button

@export var hide_time = 0.5

var add_timer = Timer.new()

signal damage_signal

func  _ready():
	reset_hp()
	init_timer()
	hp_sum_obj.text = ""
	
func init_timer():
	add_timer.connect("timeout", Callable(self, "release_timer"))
	add_timer.set_one_shot(true)
	add_timer.set_wait_time(1.0)
	add_child(add_timer)

func reset_hp():
	hp = hp_default
	set_text(hp_obj, hp, true)
	
func destroy_sum():
	hp_temp = 0
	add_timer.stop()
	if(hide_tween):
		hide_tween.kill()
	hp_sum_obj.self_modulate = Color(1,1,1,0)	

func release_timer():
	emit_signal("damage_signal", self, hp_temp)
	hp += hp_temp
	set_text(hp_obj, hp, true)
	hp_temp = 0
	hide_tween = hp_sum_obj.create_tween()
	hide_tween.tween_property(hp_sum_obj, 'self_modulate', Color(1,1,1,0), hide_time)
	
func step_back(value):
	hp -= value
	set_text(hp_obj, hp, true)
	destroy_sum()

func add_hp(value):
	hp_temp += value
	set_text(hp_sum_obj, hp_temp)
	add_timer.start()
	hp_sum_obj.self_modulate = Color(1,1,1,1)
	if(hide_tween):
		hide_tween.kill()

func set_text(obj, value, value_bool : = false):
	var plus = "+"
	if(value < 1 || value_bool):
		plus = ""
	obj.text = plus + str(value)
