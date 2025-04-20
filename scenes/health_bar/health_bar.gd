extends TextureProgressBar


class_name HealthBar


signal died


const COLOR_DANGER: Color = Color("9e442e")
const COLOR_MIDDLE: Color = Color("e7b900")
const COLOR_GOOD: Color = Color("5faf2b")


@export var level_low: int = 30
@export var level_med: int = 65
@export var start_health: int = 100
@export var max_health: int = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = max_health
	value = start_health
	set_color()


func set_color() -> void:
	if value < level_low:
		tint_progress = COLOR_DANGER
	elif value < level_med:
		tint_progress = COLOR_MIDDLE
	else:
		tint_progress = COLOR_GOOD


func increment_value(v: int) -> void:
	value += v
	if value <= 0:
		died.emit()
	set_color()


func take_damage(v: int) -> void:
	increment_value(-v)
