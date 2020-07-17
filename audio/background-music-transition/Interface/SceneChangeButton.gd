extends Button


export(String, FILE, "*.tscn") var next_scene: String


func _pressed() -> void:
	BackgroundMusic.crossfade()
	get_tree().change_scene(next_scene)
