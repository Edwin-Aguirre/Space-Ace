extends Control


@onready var play_button: UIButton = $MC/VB/PlayButton


func _ready():
	play_button.grab_focus()


func _on_play_button_pressed() -> void:
	GameManager.load_level_scene()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
