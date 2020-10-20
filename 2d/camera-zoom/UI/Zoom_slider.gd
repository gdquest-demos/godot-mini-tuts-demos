class_name ZoomSlider
extends VSlider


func setup(camera: ZoomingCamera2D) -> void:
	camera.connect("zoom_level_changed", self, "update_value")
	min_value = camera.min_zoom
	max_value = camera.max_zoom
	value = camera.zoom_level


func update_value(new_value: float) -> void:
	value = new_value
