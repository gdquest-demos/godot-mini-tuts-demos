extends Sprite
class_name Actor

export var speed := 600.0
export var direction := Vector2.ZERO

var _velocity := Vector2.ZERO


func _process(delta: float) -> void:
	_velocity = direction * speed
	if not direction.is_equal_approx(Vector2.ZERO):
		rotation = _velocity.angle()
	translate(_velocity * delta)
