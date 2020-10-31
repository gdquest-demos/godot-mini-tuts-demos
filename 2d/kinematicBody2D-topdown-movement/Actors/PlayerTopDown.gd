extends KinematicBody2D

export var speed := 500

var _frame_index := {Vector2.RIGHT : 1,Vector2.LEFT : 2,Vector2.UP : 3,Vector2.DOWN : 4}
var _velocity := Vector2.ZERO

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	var direction_x := Input.get_action_strength("right") - Input.get_action_strength("left")
	var direction_y := Input.get_action_strength("down") - Input.get_action_strength("up")
	var target_velocity = Vector2(direction_x,direction_y).normalized() * speed
	move_and_slide(target_velocity)


func _unhandled_input(event):
	if event.is_action_pressed("right"):
		look_to(Vector2.RIGHT)
	elif event.is_action_pressed("left"):
		look_to(Vector2.LEFT)
	elif event.is_action_pressed("down"):
		look_to(Vector2.DOWN)
	elif event.is_action_pressed("up"):
		look_to(Vector2.UP)


func look_to(direction : Vector2) -> void:
	animated_sprite.frame = _frame_index[direction]
