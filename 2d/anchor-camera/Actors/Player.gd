class_name Player
extends KinematicBody2D

export var speed := 520.0
export var angular_speed := 3.0


func _physics_process(delta):
	var direction := Input.get_action_strength('right') - Input.get_action_strength('left')
	var velocity = Input.get_action_strength("move") * transform.x * speed
	rotation += direction * angular_speed * delta
	move_and_slide(velocity)
