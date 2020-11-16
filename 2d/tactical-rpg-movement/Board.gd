## Represents and manages the game board. Stores references to entities that are in each cell and
## tells whether cells are occupied or not.
## Units can only move around the grid one at a time.
class_name Board
extends Node2D

const DIRECTIONS = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]

## Resource of type Grid.
export var grid: Resource

## Array of size `grid_size` that stores references to the grid cells' content.
var _units := {}
var _selected_unit: Unit

onready var cursor: Cursor = $Cursor


func _ready() -> void:
	_reinitialize()


func _unhandled_input(event: InputEvent) -> void:
	if _selected_unit and event.is_action_pressed("ui_cancel"):
		_deselect_unit()


func _get_configuration_warning() -> String:
	var warning := ""
	if not grid:
		warning = "You need a Grid resource for this node to work."
	return warning


## Returns `true` if the cell is occupied.
func is_occupied(grid_position: Vector2) -> bool:
	return true if _units[grid_position] != null else false


## Clears, and refills the `_units` dictionary with game objects that are on the board.
func _reinitialize() -> void:
	_units.clear()
	for child in get_children():
		if not child is Unit:
			continue
		var coordinates: Vector2 = grid.calculate_grid_coordinates(child.position)
		_units[coordinates] = child


func get_walkable_cells(cell: Vector2, max_distance: int) -> Array:
	var out := []
	_flood_fill(out, cell, max_distance)
	return out


## Fills the `array` with coordinates of walkable cells based on the `max_distance`.
func _flood_fill(array: Array, cell: Vector2, max_distance: int) -> void:
	if is_occupied(cell):
		return
	elif max_distance == 0:
		return

	array.append(cell)
	for direction in DIRECTIONS:
		var coordinates: Vector2 = cell + direction
		if is_occupied(coordinates):
			continue
		_flood_fill(array, coordinates, max_distance - 1)


func _on_Unit_move_requested(new_cell: Vector2, unit: Unit) -> void:
	var cell: Vector2 = grid.calculate_grid_coordinates(unit.position)
	if is_occupied(cell):
		return
	_units.erase(cell)
	_units[new_cell] = unit


func _on_Cursor_accept_pressed(cell: Vector2) -> void:
	# Select unit
	if not _selected_unit:
		_select_unit(cell)
	else:
		_selected_unit.cell = cell


func _select_unit(cell: Vector2) -> void:
	if not _units.has(cell):
		return
	var unit: Unit = _units[cell]
	_selected_unit = unit
	unit.is_selected = true


func _deselect_unit() -> void:
	_selected_unit.is_selected = false
	_selected_unit = null
