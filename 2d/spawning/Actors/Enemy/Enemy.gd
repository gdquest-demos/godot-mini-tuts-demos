extends Node2D

export var speed := 600
export var direction := Vector2.DOWN

var _velocity := Vector2.ZERO


func _process(delta: float) -> void:
	_velocity = direction * speed
	rotation = _velocity.angle()
	translate(_velocity * delta)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
