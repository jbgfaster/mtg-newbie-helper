extends Control

@export var menu_panel_obj : Node

@export var life_counter_obj : Node
@export var drop_dice_obj : Node
@export var help_note_obj : Node

var menu_type = MENU_TYPE.MENU

func _ready():
	show_life()

func  hide_all():
	life_counter_obj.hide()
	drop_dice_obj.hide()
#	help_note_obj.hide()
	menu_panel_obj.hide()

func show_menu():
	menu_type = MENU_TYPE.MENU
	hide_all()
	menu_panel_obj.show()

func show_life():
	menu_type = MENU_TYPE.HEALTH
	hide_all()
	life_counter_obj.show()
	
func show_dice():
	menu_type = MENU_TYPE.HEALTH
	hide_all()
	drop_dice_obj.show()
	
func show_help():
	menu_type = MENU_TYPE.HEALTH
	hide_all()
	help_note_obj.show()

enum MENU_TYPE
{
	MENU,
	HEALTH,
	DICE,
	HELP
}
