extends Node2D


const ADD_OBJECT: String = "add_object"
const EXPLOSION = preload("res://scenes/explosion/explosion.tscn")
const POWER_UP = preload("res://scenes/power_up/power_up.tscn")
const BULLET_BOMB = preload("res://scenes/bullets/bullet_bomb.tscn")
const BULLET_ENEMY = preload("res://scenes/bullets/bullet_enemy.tscn")
const BULLET_PLAYER = preload("res://scenes/bullets/bullet_player.tscn")
const HOMING_MISSLE = preload("res://scenes/homing_missile/homing_missile.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(on_create_explosion)
	SignalHub.on_create_powerup.connect(on_create_powerup)
	SignalHub.on_create_powerup_random.connect(on_create_powerup_random)
	SignalHub.on_create_bullet.connect(on_create_bullet)
	SignalHub.on_create_homing_missile.connect(on_create_homing_missile)


func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos


func on_create_homing_missile(pos: Vector2):
	var missile: Homing_Missile = HOMING_MISSLE.instantiate()
	call_deferred(ADD_OBJECT, missile, pos)


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


func on_create_bullet(pos: Vector2, direction: Vector2, speed: float, bullet_type: BulletBase.BulletType) -> void:
	var bullet: BulletBase
	match bullet_type:
		BulletBase.BulletType.Player:
			bullet = BULLET_PLAYER.instantiate()
		BulletBase.BulletType.Enemy:
			bullet = BULLET_ENEMY.instantiate()
		BulletBase.BulletType.Bomb:
			bullet = BULLET_BOMB.instantiate()
	if bullet:
		bullet.setup(direction, speed)
		call_deferred(ADD_OBJECT, bullet, pos)
