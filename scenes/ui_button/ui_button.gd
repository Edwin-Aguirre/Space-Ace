extends TextureButton


class_name UIButton


@export var text: String = "Set Me"


@onready var button_label_text: Label = $ButtonLabelText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_label_text.text = text
