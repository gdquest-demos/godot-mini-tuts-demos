extends KinematicBody2D

export var speed := 500
export var angular_speed := 5.0

onready var animated_sprite: AnimatedSprite = $AnimatedSprite


func _physics_process(delta):
	var direction := Input.get_action_strength("right") - Input.get_action_strength("left")
	var velocity := (
		Input.get_action_strength("down") * transform.y * speed
		- Input.get_action_strength("up") * transform.y * speed
	)
	rotation += direction * angular_speed * delta
	move_and_slide(velocity)
