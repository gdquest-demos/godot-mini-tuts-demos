extends Node2D

var space_scene := "res://Levels/SpaceLevel.tscn"
var flappy_scene := "res://Levels/FlappyLevel.tscn"
var angry_scene := "res://Levels/AngryLevel.tscn"
var geometry_scene := "res://Levels/GeometryLevel.tscn"


func _unhandled_input(event):
	if event.is_action_pressed("load_space"):
		get_tree().change_scene(space_scene)
	elif event.is_action_pressed("load_flappy"):
		get_tree().change_scene(flappy_scene)
	elif event.is_action_pressed("load_angry"):
		get_tree().change_scene(angry_scene)
	elif event.is_action_pressed("load_geometry"):
		get_tree().change_scene(geometry_scene)
