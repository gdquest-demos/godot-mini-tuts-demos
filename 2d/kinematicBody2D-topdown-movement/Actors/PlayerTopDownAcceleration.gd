extends KinematicBody2D

export var speed := 500
export var friction = 0.1
export var acceleration = 0.05

var _frame_index := {Vector2.RIGHT: 1, Vector2.LEFT: 2, Vector2.UP: 3, Vector2.DOWN: 4}
var _velocity := Vector2.ZERO

onready var animated_sprite: AnimatedSprite = $AnimatedSprite


func _physics_process(delta):
	var direction_x := Input.get_action_strength("right") - Input.get_action_strength("left")
	var direction_y := Input.get_action_strength("down") - Input.get_action_strength("up")
	var target_velocity := Vector2(direction_x, direction_y).normalized() * speed
	if target_velocity.is_equal_approx(Vector2.ZERO):
		_velocity = lerp(_velocity, Vector2.ZERO, friction)
	else:
		_velocity = lerp(_velocity, target_velocity, acceleration)
	_velocity = move_and_slide(_velocity)


func _unhandled_input(event):
	if event.is_action_pressed("right"):
		look_to(Vector2.RIGHT)
	elif event.is_action_pressed("left"):
		look_to(Vector2.LEFT)
	elif event.is_action_pressed("down"):
		look_to(Vector2.DOWN)
	elif event.is_action_pressed("up"):
		look_to(Vector2.UP)


func look_to(direction: Vector2) -> void:
	animated_sprite.frame = _frame_index[direction]
