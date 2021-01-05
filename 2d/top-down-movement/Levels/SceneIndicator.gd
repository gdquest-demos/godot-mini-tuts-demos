extends MarginContainer


func _ready() -> void:
	$ColorRect/Label.text = get_node("/root/").get_child(0).name


func update_label(node_name: String) -> void:
	$ColorRect/Label.text = node_name
