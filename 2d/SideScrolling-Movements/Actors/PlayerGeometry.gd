extends KinematicBody2D

export var gravity := 4000
export var jump_impulse := 1000
export var speed := 400

var _velocity := Vector2.ZERO


func _physics_process(delta) -> void:
	_velocity.x = speed
	_velocity.y += gravity * delta
	_velocity = move_and_slide(_velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			_velocity.y = -jump_impulse
