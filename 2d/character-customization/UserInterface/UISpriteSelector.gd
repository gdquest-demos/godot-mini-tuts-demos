class_name UISpriteSelector
extends Control

signal sprite_changed(texture)

var _sprites := []
var _index := 0 setget _set_index

onready var texture_rect: TextureRect = $TextureRect


func setup(sprite_textures: Array) -> void:
	_sprites = sprite_textures
	_set_index(0)


func _on_PreviousButton_pressed() -> void:
	_set_index(_index - 1)


func _on_NextButton_pressed() -> void:
	_set_index(_index + 1)


func _set_index(value: int) -> void:
	_index = wrapi(value, 0, _sprites.size())
	var texture: StreamTexture = _sprites[_index]
	texture_rect.texture = texture
	emit_signal("sprite_changed", texture)
