class_name AnchorDetector
extends Area2D


func _on_AnchorDetector_area_entered(area: Node) -> void:
	if area is Anchor:
		EVENTS.emit_signal("camera_to_anchor", area.global_position, area.zoom_level)


func _on_AnchorDetector_area_exited(area: Node) -> void:
	for _area in get_overlapping_areas():
		if not _area == area and _area is Anchor:
			return
	EVENTS.emit_signal("camera_to_player", area.global_position)
