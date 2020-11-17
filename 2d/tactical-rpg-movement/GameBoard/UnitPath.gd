class_name UnitPath
extends TileMap

export var grid: Resource

var _pathfinder: PathFinder
var _cell_start


func initialize(walkable_cells: Array) -> void:
	_pathfinder = PathFinder.new(grid, walkable_cells)


func draw(cell_start: Vector2, cell_end: Vector2) -> void:
	clear()
	var cells := _pathfinder.calculate_point_path(cell_start, cell_end)
	for cell in cells:
		set_cellv(cell, 0)
	update_bitmask_region()


func stop() -> void:
	_pathfinder = null
	clear()
