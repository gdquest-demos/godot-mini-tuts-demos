tool
class_name DiscreteTexture
extends GradientTexture


func _init() -> void:
	width = 256


func discrete() -> ImageTexture:
	var out := ImageTexture.new()
	if gradient != null:
		var image := Image.new()
		image.create(width, 1, false, Image.FORMAT_RGBA8)
		var point_count := gradient.get_point_count()
		image.lock()
		for index in (point_count - 1) if point_count > 1 else point_count:
			var offset1: float = gradient.offsets[index]
			var offset2: float = gradient.offsets[index + 1] if point_count > 1 else 1
			var color: Color = gradient.colors[index]
			for x in range(width * offset1, width * offset2):
				image.set_pixel(x, 0, color)
		image.unlock()
		out.create_from_image(image, 0)
	return out
