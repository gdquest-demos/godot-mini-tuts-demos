extends Control

signal hat_changed(texture)
signal head_changed(texture)
signal glasses_changed(texture)

const DATA := {
	"hat" :
	[
		preload("Sprites/hat1.png"),
		preload("Sprites/hat2.png"),
		preload("Sprites/hat3.png")
		],
	"glasses" : [
		preload("Sprites/sun-glasses1.png"),
		preload("Sprites/sun-glasses2.png"),
		preload("Sprites/sun-glasses3.png")
		],
	"head": [
		preload("Sprites/head1.png"),
		preload("Sprites/head2.png"),
		preload("Sprites/head3.png") ]
	}

const sprite_selector_scene: PackedScene = preload("UISpriteSelector.tscn")

onready var vbox_container: VBoxContainer = $Panel/VBoxContainer


func _ready() -> void:
	for key in DATA:
		var textures: Array = DATA[key]
		var sprite_selector: UISpriteSelector = sprite_selector_scene.instance()
		vbox_container.add_child(sprite_selector)
		sprite_selector.setup(textures)
		sprite_selector.connect("sprite_changed", self, "_on_SpriteSelector_sprite_changed", [key])


func _on_SpriteSelector_sprite_changed(texture: StreamTexture, key: String) -> void:
	emit_signal(key + "_changed", texture)
