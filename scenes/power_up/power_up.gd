extends Projectile


class_name PowerUp


enum PowerUpType { Health, Shield }


const SPEED: float = 80.0
const TEXTURES: Dictionary = {
	PowerUpType.Health: preload("res://assets/misc/powerups/powerupGreen_star.png"),
	PowerUpType.Shield: preload("res://assets/misc/powerups/powerupBlue_shield.png"),
}


@onready var sprite_2d: Sprite2D = $Sprite2D


var power_up_type: PowerUpType = PowerUpType.Shield:
	get: return power_up_type


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = TEXTURES[power_up_type]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += delta * SPEED * Vector2.DOWN
