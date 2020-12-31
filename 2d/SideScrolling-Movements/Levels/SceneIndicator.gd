extends MarginContainer


func _ready() -> void:
	$ColorRect/Label.text = owner.owner.name
