extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("load_space"):
		get_tree().change_scene("res://Demo.tscn")
	elif event.is_action_pressed("load_flappy"):
		get_tree().change_scene("res://Demo.tscn")
	elif event.is_action_pressed("load_angry"):
		get_tree().change_scene("res://Levels/AngryLevel.tscn")
	elif event.is_action_pressed("load_geometry"):
		get_tree().change_scene("res://Demo.tscn")
