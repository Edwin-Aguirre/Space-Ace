extends Projectile


class_name BulletBase


enum BulletType { Player, Enemy, Bomb }


var _direction: Vector2 = Vector2.UP
var _speed: float = 20.0


func _process(delta: float) -> void:
	position += delta * _direction * _speed


func setup(direction: Vector2, speed: float) -> void:
	_direction = direction
	_speed = speed


func blow_up() -> void:
	SignalHub.emit_on_create_explosion(global_position, Explosion.EXPLODE)
	super()
