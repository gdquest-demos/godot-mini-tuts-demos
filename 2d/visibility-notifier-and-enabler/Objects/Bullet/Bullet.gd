class_name Bullet
extends Node2D

export var speed := 800.0

func _physics_process(delta: float) -> void:
	var velocity := Vector2.RIGHT.rotated(rotation) * speed
	translate(velocity * delta)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
