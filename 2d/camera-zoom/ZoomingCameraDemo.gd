extends Node2D


onready var zoom_slider: VSlider = $UI/ZoomSlider
onready var camera: ZoomingCamera2D = $Player/ZoomingCamera2D


func _ready() -> void:
	zoom_slider.setup(camera)


func _on_ZoomSlider_value_changed(value: float) -> void:
	camera.zoom_level = value
