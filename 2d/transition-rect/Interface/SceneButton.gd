extends Button

export(String, FILE, "*.tscn") var scene_path

signal scene_prompted(prompted_scene_path)

func _pressed() -> void:
	emit_signal("scene_prompted", scene_path)
