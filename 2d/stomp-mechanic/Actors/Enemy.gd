extends KinematicBody2D
class_name Enemy

const FLOOR_NORMAL := Vector2.UP

export var speed := Vector2(400.0, 500.0)
export var gravity := 3500.0
export var stomp_impulse := 600.0

var _velocity := Vector2.ZERO


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func kill() -> void:
	queue_free()
