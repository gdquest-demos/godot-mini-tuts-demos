tool
class_name Cursor
extends Node2D

signal accept_pressed(cell)
signal moved(new_cell)

enum State { IDLE, MOVING }

## Grid resource, giving the node access to the grid size, and more.
export var grid: Resource
## Time before the cursor can move again in seconds.
export var ui_cooldown := 0.1

## Coordinates of the current cell the cursor moved to.
var cell := Vector2.ZERO setget set_cell

onready var timer: Timer = $Timer


func _ready() -> void:
	timer.wait_time = ui_cooldown
	position = grid.calculate_map_position(cell)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.cell = grid.calculate_grid_coordinates(event.position)
	elif event.is_action_pressed("click") or event.is_action_pressed("ui_accept"):
		emit_signal("accept_pressed", cell)
		get_tree().set_input_as_handled()

	if not event.is_pressed():
		return
	if event.is_echo() and not timer.is_stopped():
		return

	if event.is_action("ui_right"):
		self.cell += Vector2.RIGHT
	elif event.is_action("ui_up"):
		self.cell += Vector2.UP
	elif event.is_action("ui_left"):
		self.cell += Vector2.LEFT
	elif event.is_action("ui_down"):
		self.cell += Vector2.DOWN


func _draw() -> void:
	draw_rect(Rect2(-grid.cell_size / 2, grid.cell_size), Color.aliceblue, false, 2.0)


func set_cell(value: Vector2) -> void:
	if not grid.is_within_bounds(value):
		cell = grid.clamp(value)
	else:
		cell = value
	position = grid.calculate_map_position(cell)
	emit_signal("moved", cell)
	timer.start()
