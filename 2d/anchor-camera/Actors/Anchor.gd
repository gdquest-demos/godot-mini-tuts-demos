class_name Anchor
extends Area2D

export var zoom_level := 1.0


func _on_Anchor_body_entered(body: Node) -> void:
	if body is Player:
		EVENTS.emit_signal("player_entered", self.global_position, self.zoom_level)
