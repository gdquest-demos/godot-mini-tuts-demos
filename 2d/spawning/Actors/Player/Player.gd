extends Sprite

onready var spawner := $BulletSpawner2D


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		spawner.spawn()
