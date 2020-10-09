extends Control


func _on_UIVideoSettings_apply_video_settings(resolution, fullscreen, vsync):
	OS.window_fullscreen = fullscreen
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, resolution)
	OS.set_window_size(resolution)
	OS.vsync_enabled = vsync
