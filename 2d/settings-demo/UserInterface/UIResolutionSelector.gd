extends Control

signal resolution_changed(new_resolution)

onready var option_button: OptionButton = $OptionButton


func _update_selected_item(index: int) -> void:
	var values := option_button.text.split_floats("x")
	emit_signal("resolution_changed", Vector2(values[0], values[1]))


func _on_OptionButton_item_selected(index: int) -> void:
	_update_selected_item(index)
