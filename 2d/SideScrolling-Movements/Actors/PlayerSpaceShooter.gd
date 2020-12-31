extends KinematicBody2D

export var speed := 400
export var minimum_speed := Vector2(400, 0)

var _velocity := Vector2.ZERO


func _physics_process(delta) -> void:
	var direction := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	var target_velocity = direction.normalized() * speed
	move_and_slide(target_velocity + minimum_speed)
