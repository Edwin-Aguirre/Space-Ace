extends Node2D


const ADD_OBJECT: String = "add_object"
const EXPLOSION = preload("res://scenes/explosion/explosion.tscn")
const POWER_UP = preload("res://scenes/power_up/power_up.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(on_create_explosion)
	SignalHub.on_create_powerup.connect(on_create_powerup)
	SignalHub.on_create_powerup_random.connect(on_create_powerup_random)


func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos


func on_create_explosion(pos: Vector2, anim_name: String) -> void:
	var explosion: Explosion = EXPLOSION.instantiate()
	explosion.setup(anim_name)
	call_deferred(ADD_OBJECT, explosion, pos)


func on_create_powerup(pos: Vector2, powerup_type: PowerUp.PowerUpType) -> void:
	var powerup: PowerUp = POWER_UP.instantiate()
	powerup.power_up_type = powerup_type
	call_deferred(ADD_OBJECT, powerup, pos)


func on_create_powerup_random(pos: Vector2) -> void:
	var random_powerup: PowerUp.PowerUpType = PowerUp.PowerUpType.values().pick_random()
	on_create_powerup(pos, random_powerup)
