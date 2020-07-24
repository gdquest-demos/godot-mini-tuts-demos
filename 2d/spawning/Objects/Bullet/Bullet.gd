extends Sprite


export var speed := 600
export var direction := Vector2.RIGHT

var _velocity := Vector2.ZERO


func _process(delta: float) -> void:
	_velocity = speed * direction
	translate(_velocity * delta)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
