class_name AnchorCamera2D
extends Camera2D

export var anchor_duration := 0.5

var _anchor_pos := Vector2.ZERO setget _set_anchor_pos
var _zoom_level := 1.0 setget _set_zoom_level

onready var tween: Tween = $Tween


func _ready() -> void:
	EVENTS.connect("camera_to_anchor", self, "_on_camera_to_anchor")
	EVENTS.connect("camera_to_player", self, "_on_camera_to_player")


func _set_anchor_pos(new_pos: Vector2) -> void:
	_anchor_pos = new_pos
	tween.interpolate_property(
		self,
		"global_position",
		global_position,
		_anchor_pos,
		anchor_duration,
		tween.TRANS_SINE,
		tween.EASE_OUT
	)
	tween.start()


func _set_zoom_level(new_zoom: float) -> void:
	_zoom_level = new_zoom
	tween.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(_zoom_level, _zoom_level),
		anchor_duration,
		tween.TRANS_SINE,
		tween.EASE_OUT
	)
	tween.start()


func _set_camera_to_player(prev_anchor_position: Vector2) -> void:
	set_as_toplevel(false)
	global_position = prev_anchor_position
	tween.interpolate_property(
		self, "position", position, Vector2.ZERO, anchor_duration, tween.TRANS_SINE, tween.EASE_OUT
	)
	tween.start()


func _on_camera_to_anchor(new_anchor_position: Vector2, new_zoom_level: float) -> void:
	set_as_toplevel(true)
	_set_anchor_pos(new_anchor_position)
	_set_zoom_level(new_zoom_level)


func _on_camera_to_player(prev_anchor_position: Vector2) -> void:
	if not _zoom_level == 1.0:
		_set_zoom_level(1.0)
	_set_camera_to_player(prev_anchor_position)
