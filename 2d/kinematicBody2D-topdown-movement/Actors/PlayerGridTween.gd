extends KinematicBody2D

export var tween_duration := 0.25

var _frame_index := {Vector2.RIGHT: 1, Vector2.LEFT: 2, Vector2.UP: 3, Vector2.DOWN: 4}
var _tile_size := 64
var _speed_to_test := 5

onready var animated_sprite: AnimatedSprite = $AnimatedSprite
onready var tween: Tween = $Tween


func _ready() -> void:
	position = position.snapped(Vector2.ONE * _tile_size)


func _unhandled_input(event):
	if event.is_action_pressed("right"):
		move(Vector2.RIGHT)
	elif event.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif event.is_action_pressed("down"):
		move(Vector2.DOWN)
	elif event.is_action_pressed("up"):
		move(Vector2.UP)


func move(direction: Vector2) -> void:
	look_to(direction)
	position = position.snapped(Vector2.ONE * _tile_size)
	var end_position = position + direction * _tile_size
	var collision := move_and_collide(direction * _speed_to_test, true, true, true)
	if ! collision:
		tween.interpolate_property(
			self,
			"position",
			position,
			end_position,
			tween_duration,
			Tween.TRANS_CUBIC,
			Tween.EASE_IN_OUT
		)
		tween.start()


func look_to(direction: Vector2) -> void:
	animated_sprite.frame = _frame_index[direction]
