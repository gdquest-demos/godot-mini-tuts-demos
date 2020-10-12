# Controls and updates the actual game settings this node receives from the
# user interface.
extends Node2D


# We use a dictionary to represent settings because we have few values for now. Also, when you have
# many more settings, you can replace it with an object without having to refactor the code too
# much, as in GDScript, you can access a dictionary's keys like you would access an object's member
# variables.
func update_settings(settings: Dictionary) -> void:
	OS.window_fullscreen = settings.fullscreen
	get_tree().set_screen_stretch(
		SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, settings.resolution
	)
	OS.set_window_size(settings.resolution)
	OS.vsync_enabled = settings.vsync


func _on_UIVideoSettings_apply_button_pressed(settings) -> void:
	update_settings(settings)
