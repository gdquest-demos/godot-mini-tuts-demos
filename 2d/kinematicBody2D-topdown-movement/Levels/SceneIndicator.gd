extends MarginContainer


func _ready() -> void:
	var children = get_node("/root/Demo/Level1").get_children()
	for child in children:
		if "Player" in child.name:
			$ColorRect/Label.text = child.name


func update_label(node_name: String) -> void:
	$ColorRect/Label.text = node_name
