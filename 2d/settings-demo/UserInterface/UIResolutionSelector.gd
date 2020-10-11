extends OptionButton

signal resolution_changed(new_resolution)


func _ready() -> void:
	_on_ResolutionOptionButton_item_selected(0)


func _on_ResolutionOptionButton_item_selected(index):
	var new_values := text.split_floats("x")
	emit_signal("resolution_changed", Vector2(new_values[0], new_values[1]))
