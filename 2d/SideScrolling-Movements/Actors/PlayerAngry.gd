extends Node2D

export var impulse := 1000

var angry_bullet: PackedScene = load("res://Actors/PlayerAngryBullet.tscn")


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var angry_node: RigidBody2D = angry_bullet.instance()
		angry_node.global_position = global_position
		angry_node.linear_velocity = global_transform.x * impulse
		owner.add_child(angry_node)
