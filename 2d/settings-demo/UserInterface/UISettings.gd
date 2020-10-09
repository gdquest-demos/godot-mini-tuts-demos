extends Control

var _resolution : Vector2
var _fullscreen := false
var _vsync := false

onready var fullscreen_checkbox := $Panel/FullScreen/FullScreenCheckBox


func _ready() -> void:
	_apply_settings()
	

func _on_Button_pressed() -> void:
	_apply_settings()


func _apply_settings() -> void:
	OS.window_fullscreen = _fullscreen
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, _resolution)
	OS.set_window_size(_resolution)
	OS.vsync_enabled = _vsync


func set_resolution(new_resolution : Vector2) -> void:
	_resolution = new_resolution


func set_fullscreen(new_fullscreen : bool)  -> void:
	_fullscreen = new_fullscreen
	
	
func set_vsync(new_vsync : bool)  -> void:
	_vsync = new_vsync
	

