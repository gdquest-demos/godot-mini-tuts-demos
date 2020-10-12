class_name AnchorCamera2D
extends Camera2D

export var anchor_duration := 0.5

var _anchor_pos := Vector2.ZERO setget _set_anchor_pos

onready var tween: Tween = $Tween


func _ready() -> void:
	EVENTS.connect("player_entered", self, "_on_player_entered")


func _set_anchor_pos(new_pos: Vector2) -> void:
	_anchor_pos = new_pos
	tween.interpolate_property(
		self,
		"position",
		global_position,
		_anchor_pos,
		anchor_duration,
		tween.TRANS_SINE,
		tween.EASE_OUT
	)
	tween.start()


func _on_player_entered(new_anchor_position: Vector2) -> void:
	_set_anchor_pos(new_anchor_position)

