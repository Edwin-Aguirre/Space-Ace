extends Node


signal on_player_hit(v: int)
signal on_score_updated(v: int)
signal on_create_explosion(pos: Vector2, anim_name: String)
signal on_create_powerup(pos: Vector2, powerup_type: PowerUp.PowerUpType)
signal on_create_powerup_random(pos: Vector2)
signal on_create_bullet(pos: Vector2, direction: Vector2, speed: float, bullet_type: BulletBase.BulletType)
signal on_player_health_bonus(v: int)
signal on_create_homing_missile(pos: Vector2)


func emit_on_player_health_bonus(v: int):
	on_player_health_bonus.emit(v)


func emit_on_create_bullet(pos: Vector2, direction: Vector2, speed: float, bullet_type: BulletBase.BulletType):
	on_create_bullet.emit(pos, direction, speed, bullet_type)


func emit_on_create_powerup(pos: Vector2, powerup_type: PowerUp.PowerUpType):
	on_create_powerup.emit(pos, powerup_type)


func emit_on_create_powerup_random(pos: Vector2):
	on_create_powerup_random.emit(pos)


func emit_on_player_hit(v: int) -> void:
	on_player_hit.emit(v)


func emit_on_score_updated(v: int):
	on_score_updated.emit(v)


func emit_on_create_explosion(pos: Vector2, anim_name: String):
	on_create_explosion.emit(pos, anim_name)


func emit_on_create_homing_missile(pos: Vector2):
	on_create_homing_missile.emit(pos)
