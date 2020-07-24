extends Node2D


export var move_right_action := "move_right"
export var move_left_action := "move_left"
export var move_down_action := "move_down"
export var move_up_action := "move_up"

onready var _actor := $Actor

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_type():
		update_actor_direction()


func update_actor_direction() -> void:
	_actor.direction.x = Input.get_action_strength(move_right_action) - Input.get_action_strength(move_left_action)
	_actor.direction.y = Input.get_action_strength(move_down_action) - Input.get_action_strength(move_up_action)
