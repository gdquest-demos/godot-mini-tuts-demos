extends Sprite
class_name Actor

export var speed := 600.0
export var direction := Vector2.ZERO

var _velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	_velocity = direction * speed
	if not direction.is_equal_approx(Vector2.ZERO):
		rotation = _velocity.angle()
	translate(_velocity * delta)
	
	position.x = clamp(position.x, 0.0, 2048)
	position.y = clamp(position.y, 0.0, 1200)
