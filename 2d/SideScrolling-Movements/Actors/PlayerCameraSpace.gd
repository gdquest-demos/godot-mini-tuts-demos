extends Node2D

export var minimum_speed := Vector2(400, 0)


func _process(delta: float) -> void:
	position += minimum_speed * delta
