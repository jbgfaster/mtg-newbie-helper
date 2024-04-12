extends Control

@export var note_text : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScrollContainer/VBoxContainer/Button1.connect("button_down",Callable(self,"show_note").bind($ScrollContainer/VBoxContainer/Button1.help_text))

func show_note(value):
	note_text.show()
	note_text.text = str(value)
