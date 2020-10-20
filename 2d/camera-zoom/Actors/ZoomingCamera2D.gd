class_name ZoomingCamera2D
extends Camera2D

signal zoom_level_changed(new_value)

export var zoom_duration := 0.2
export var zoom_factor := 0.1
export var min_zoom := 0.5
export var max_zoom := 2.0

var zoom_level := 1.0 setget set_zoom_level

onready var tween: Tween = $Tween


func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		set_zoom_level(zoom_level - zoom_factor)
	if event.is_action_pressed("zoom_out"):
		set_zoom_level(zoom_level + zoom_factor)


func set_zoom_level(value: float) -> void:
	zoom_level = clamp(value, min_zoom, max_zoom)
	emit_signal("zoom_level_changed", zoom_level)
	tween.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(zoom_level, zoom_level),
		zoom_duration,
		tween.TRANS_SINE,
		tween.EASE_OUT
	)
	tween.start()
