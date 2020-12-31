extends Node2D

var topdown_player := load("res://Actors/PlayerTopDown.tscn")
var topdown_acc_player := load("res://Actors/PlayerTopDownAcceleration.tscn")
var grid_player := load("res://Actors/PlayerGrid.tscn")
var grid_tween_player := load("res://Actors/PlayerGridTween.tscn")
var rotate_move_player := load("res://Actors/PlayerRotate.tscn")
var platformer_player := load("res://Actors/PlayerPlatformer.tscn")


func _unhandled_input(event):
	if event.is_action_pressed("load_topdown"):
		substitute_player(topdown_player.instance())
	elif event.is_action_pressed("load_topdown_acc"):
		substitute_player(topdown_acc_player.instance())
	elif event.is_action_pressed("load_grid"):
		substitute_player(grid_player.instance())
	elif event.is_action_pressed("load_grid_tween"):
		substitute_player(grid_tween_player.instance())
	elif event.is_action_pressed("load_rotate_move"):
		substitute_player(rotate_move_player.instance())
	elif event.is_action_pressed("load_platformer"):
		substitute_player(platformer_player.instance())


func substitute_player(instance) -> void:
	var children = get_node("Level1").get_children()
	for c in children:
		if c is KinematicBody2D and "Player" in c.name:
			c.queue_free()
	instance.position = Vector2(-384, 384)
	get_node("Level1").add_child(instance)
	$SceneIndicator.update_label(instance.name)
