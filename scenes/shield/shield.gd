extends Area2D


class_name Shield


const SFX_SHIELD_UP = preload("res://assets/sounds/powerup/sfx_shieldUp.ogg")
const SFX_SHIELD_DOWN = preload("res://assets/sounds/powerup/sfx_shieldDown.ogg")


@export var start_health: int = 5


@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer2D = $Sound
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var _health: int = start_health


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disable_shield()


func enable_shield() -> void:
	animation_player.play("RESET")
	_health = start_health
	timer.start()
	SpaceUtils.toggle_area2d(self, true)
	sound.stream = SFX_SHIELD_UP
	sound.play()
	show()


func disable_shield() -> void:
	timer.stop()
	SpaceUtils.toggle_area2d(self, false)
	sound.stream = SFX_SHIELD_DOWN
	sound.play()
	hide()


func hit() -> void:
	animation_player.play("hit")
	_health -= 1
	if _health <= 0:
		disable_shield()


func _on_area_entered(_area: Area2D) -> void:
	hit()


func _on_timer_timeout() -> void:
	disable_shield()
