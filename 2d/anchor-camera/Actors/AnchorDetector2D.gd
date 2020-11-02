class_name AnchorDetector2D
extends Area2D

signal anchor_detected(anchor)
signal anchor_detached


func _on_area_entered(area: Anchor2D) -> void:
	emit_signal("anchor_detected", area)


func _on_area_exited(area: Anchor2D) -> void:
	var areas: Array = get_overlapping_areas()
	if get_overlapping_areas().size() == 1 and area == areas[0]:
		emit_signal("anchor_detached")
