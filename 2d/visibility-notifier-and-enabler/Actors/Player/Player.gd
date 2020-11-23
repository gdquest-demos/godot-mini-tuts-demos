extends Sprite

export var speed := 600.0

var _velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	var direction  := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
	_velocity = direction * speed
	if not direction.is_equal_approx(Vector2.ZERO):
		rotation = _velocity.angle()
	translate(_velocity * delta)
	
	position.x = clamp(position.x, 0.0, 2048)
	position.y = clamp(position.y, 0.0, 1200)
