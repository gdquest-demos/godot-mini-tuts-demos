extends Node2D
class_name Coin

onready var animation_player := $AnimationPlayer
onready var sprite := $Sprite


func _on_Area2D_mouse_entered() -> void:
	sprite.modulate = Color(1.2, 1.2, 1.2)


func _on_Area2D_mouse_exited() -> void:
	sprite.modulate = Color.white


func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("left_click"):
		animation_player.play("Picked")
