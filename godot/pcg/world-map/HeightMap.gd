tool
extends TextureRect


const L8_MAX := float(0xff)

export var colormap: Texture = DiscreteTexture.new()


func _ready() -> void:
	colormap.connect("changed", self, "_on_Colormap_changed")
	texture.connect("changed", self, "_on_HeightMapTexture_changed")
	_on_Colormap_changed()
	_on_HeightMapTexture_changed()


func _on_Colormap_changed() -> void:
	if not colormap is DiscreteTexture:
		return
		
	if colormap.gradient != null and not colormap.gradient.is_connected("changed", self, "_on_Colormap_changed"):
		colormap.gradient.connect("changed", self, "_on_Colormap_changed")
	
	material.set_shader_param("colormap", colormap.discrete())


func _on_HeightMapTexture_changed() -> void:
	var height_map_image := texture.get_data()
	if not height_map_image:
		return
	
	height_map_image.convert(Image.FORMAT_L8)
	var height_map_minmax := get_minmax(height_map_image.get_data())
	material.set_shader_param("height_map_min", height_map_minmax.min / L8_MAX)
	material.set_shader_param("height_map_max", height_map_minmax.max / L8_MAX)


func get_minmax(array: Array) -> Dictionary:
	var out := {"min": INF, "max": -INF}
	for value in array:
		out.min = min(out.min, value)
		out.max = max(out.max, value)
	return out
