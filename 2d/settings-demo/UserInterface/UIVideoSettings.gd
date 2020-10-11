# User interface that allows the player to select game settings.
# To see how we update the actual window and rendering settings, see
# `Main.gd`.
extends Control

signal apply_button_pressed(settings)

var _settings := {resolution = Vector2(640, 480), fullscreen = false, vsync = false}


func _on_ApplyButton_pressed() -> void:
	emit_signal("apply_button_pressed", _settings)


func _on_UIResolutionSelector_resolution_changed(new_resolution: Vector2) -> void:
	_settings.resolution = new_resolution


func _on_UIFullscreenCheckbox_toggled(is_button_pressed: bool) -> void:
	_settings.fullscreen = is_button_pressed


func _on_UIVsyncCheckbox_toggled(is_button_pressed: bool) -> void:
	_settings.vsync = is_button_pressed
