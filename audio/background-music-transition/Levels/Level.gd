extends Node2D

export var music: AudioStream


func _ready() -> void:
	BackgroundMusic.crossfade_to(music)
