extends KinematicBody2D

export var speed := 400
export var gravity := 3000
export var jump_speed := -1000

var _frame_index := {
	Vector2.ZERO: 0, Vector2.RIGHT: 1, Vector2.LEFT: 2, Vector2.UP: 3, Vector2.DOWN: 4
}
var _velocity := Vector2.ZERO

onready var animated_sprite: AnimatedSprite = $AnimatedSprite


func _physics_process(delta) -> void:
	_velocity.x = (Input.get_action_strength("right") - Input.get_action_strength("left")) * speed
	_velocity.y += gravity * delta
	_velocity = move_and_slide(_velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			_velocity.y = jump_speed


func _unhandled_input(event):
	if event.is_action_pressed("right"):
		look_to(Vector2.RIGHT)
	elif event.is_action_pressed("left"):
		look_to(Vector2.LEFT)
	elif event.is_action_pressed("jump"):
		look_to(Vector2.UP)
	else:
		look_to(Vector2.ZERO)


func look_to(direction: Vector2) -> void:
	animated_sprite.frame = _frame_index[direction]
