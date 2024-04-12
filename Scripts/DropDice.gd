extends Control

@export var shop_dice_obj : Button

@export var dice : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func press_button_drop_dice(value):
	var result = get_result(value)
#	shop_dice_obj.text = get_text(result,value)
	dice.roll(result)

func get_result(value):
	var result = randi()% value + 1
	return result
	
func get_text(value, dice_value):
	var result = str(value)
	if dice_value == 2:
		if value == 2:
			result = "tails"
		else:
			result = "heads"
	return result
