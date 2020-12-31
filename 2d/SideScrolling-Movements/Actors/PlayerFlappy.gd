extends KinematicBody2D

export var speed := 400
export var gravity := 3500
export var jump_speed := -1200

var _velocity := Vector2.ZERO


func _physics_process(delta) -> void:
	_velocity.x = speed
	_velocity.y += gravity * delta
	_velocity = move_and_slide(_velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		_velocity.y = jump_speed
