extends Node2D


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("test"):
		#SignalHub.emit_on_create_explosion(Vector2(100,200), Explosion.EXPLODE)
		#SignalHub.emit_on_create_powerup(Vector2(300,350), PowerUp.PowerUpType.Health)
		#SignalHub.emit_on_create_powerup(Vector2(300,350), PowerUp.PowerUpType.Shield)
		#SignalHub.emit_on_create_powerup_random(Vector2(400,100))
		SignalHub.emit_on_create_bullet(Vector2(315,300),Vector2.DOWN, 100, BulletBase.BulletType.Enemy)
		#SignalHub.emit_on_create_bullet(Vector2(315,250),Vector2.DOWN, 100, BulletBase.BulletType.Bomb)
		
		
