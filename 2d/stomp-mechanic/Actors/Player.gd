extends KinematicBody2D
class_name Player

const FLOOR_NORMAL := Vector2.UP

export var speed := Vector2(400.0, 500.0)
export var gravity := 3500.0
export var stomp_impulse := 600.0

var _velocity := Vector2.ZERO



func _physics_process(delta: float) -> void:
	update_velocity()
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL, true)

	# Stomp mechanic
	for i in get_slide_count():
		var collision := get_slide_collision(i)
		var collider := get_slide_collision(i).collider
		var is_stomping := collider is Enemy and collision.normal.is_equal_approx(Vector2.UP) and is_on_floor()
		if is_stomping:
			_velocity.y = -stomp_impulse
			(collider as Enemy).kill()


func update_velocity() -> void:
	var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
	var direction := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_jumping else 0.0
	)

	_velocity.x = speed.x * direction.x
	_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y != 0.0:
		_velocity.y = speed.y * direction.y
