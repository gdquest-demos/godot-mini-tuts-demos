# Visual explanation of how GradientTexture -> DiscreteTexture transformation works
tool
extends VBoxContainer


export var texture: Texture = DiscreteTexture.new()

onready var discrete: TextureRect = $Discrete


func _ready() -> void:
	texture.gradient.connect("changed", self, "_update")
	_update()


func _update() -> void:
	discrete.texture = texture.discrete()
