extends KinematicBody2D

export var speed := 300.0


func _physics_process(delta) -> void:
	var direction := calculate_move_direction()
	move_and_slide(direction * speed)


func calculate_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
