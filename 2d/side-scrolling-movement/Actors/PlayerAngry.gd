extends Node2D

export var impulse := 1000

const AngryBullet: PackedScene = preload("res://Actors/PlayerAngryBullet.tscn")


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var bullet: RigidBody2D = AngryBullet.instance()
		bullet.global_position = global_position
		bullet.linear_velocity = global_transform.x * impulse
		owner.add_child(bullet)
