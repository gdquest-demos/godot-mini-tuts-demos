class_name UISpriteSelector
extends Control

signal sprite_changed(texture)

var _sprites := []
var _index := -1 setget _set_index

onready var texture_rect: TextureRect = $TextureRect


func setup(sprite_textures: Array) -> void:
	_sprites = sprite_textures
	_set_index(0)


func _on_PreviousButton_pressed() -> void:
	var new_index := wrapi(_index - 1, 0, _sprites.size())
	_set_index(new_index)


func _on_NextButton_pressed() -> void:
	var new_index := wrapi(_index + 1, 0, _sprites.size())
	_set_index(new_index)


func _set_index(value: int) -> void:
	_index = clamp(value, 0, _sprites.size()-1)
	var texture: StreamTexture = _sprites[_index]
	texture_rect.texture = texture
	emit_signal("sprite_changed", texture)
