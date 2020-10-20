class_name ZoomingCamera2D
extends Camera2D

signal zoom_level_changed(new_value)

export var zoom_duration := 0.2
export var zoom_factor := 0.1
export var min_zoom := 0.5
export var max_zoom := 2.0

var _zoom_level := 1.0 setget _set_zoom_level

onready var tween: Tween = $Tween
onready var zoom_slider: VSlider = get_node(
	"/root/ZoomingCameraDemo/UI/Zoom_slider"
)


func _ready() -> void:
	zoom_slider.connect("vslider_changed", self, "_on_Zoom_slider_vslider_changed")


func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		_set_zoom_level(_zoom_level - zoom_factor)
	if event.is_action_pressed("zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)


func _set_zoom_level(value: float) -> void:
	_zoom_level = clamp(value, min_zoom, max_zoom)
	self.emit_signal("zoom_level_changed", _zoom_level)
	tween.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(_zoom_level, _zoom_level),
		zoom_duration,
		tween.TRANS_SINE,
		tween.EASE_OUT
	)
	tween.start()


func _on_Zoom_slider_vslider_changed(new_value: float) -> void:
	_set_zoom_level(range_lerp(new_value, 100, 1, min_zoom, max_zoom))
