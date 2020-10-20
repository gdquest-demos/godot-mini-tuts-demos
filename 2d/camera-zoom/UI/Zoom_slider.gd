class_name ZoomSlider
extends VSlider

signal vslider_changed(new_value)

onready var zoom_camera: ZoomingCamera2D = get_node(
	"/root/ZoomingCameraDemo/Player/ZoomingCamera2D"
)


func _ready() -> void:
	zoom_camera.connect("zoom_level_changed", self, "_on_ZoomingCamera2D_zoom_level_changed")
	_on_ZoomingCamera2D_zoom_level_changed(zoom_camera._zoom_level)


func _on_ZoomingCamera2D_zoom_level_changed(new_value: float) -> void:
	self.value = range_lerp(new_value, zoom_camera.min_zoom, zoom_camera.max_zoom, 100, 1)


func _on_VSlider_value_changed(new_value: float) -> void:
	self.emit_signal("vslider_changed", new_value)
