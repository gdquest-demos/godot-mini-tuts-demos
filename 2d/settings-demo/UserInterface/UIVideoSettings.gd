extends Control

var _resolution := Vector2(640, 480)
var _fullscreen := false
var _vsync := true

signal apply_video_settings(resolution, fullscreen, vsync)


func _ready():
	emit_signal("apply_video_settings", _resolution, _fullscreen, _vsync)

func _on_UIResolutionSelector_resolution_changed(new_resolution : Vector2) -> void:
	_resolution = new_resolution


func _on_FullScreenCheckBox_toggled(button_pressed : bool) -> void:
	_fullscreen = button_pressed


func _on_VSyncCheckBox_toggled(button_pressed : bool) -> void:
	_vsync = button_pressed


func _on_Button_pressed():
	emit_signal("apply_video_settings", _resolution, _fullscreen, _vsync)
