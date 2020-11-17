## Draws a selected unit's walkable tiles.
class_name UnitOverlay
extends TileMap

## Resource of type Grid.
export var grid: Resource


func draw(cells: Array) -> void:
	clear()
	for cell in cells:
		set_cellv(cell, 0)
