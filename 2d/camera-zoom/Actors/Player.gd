class_name Player
extends KinematicBody2D

export var speed := 250
export var rotation_speed := 2.0
export var zoom_time := 0.2
export var zoom_factor := 0.1
export var min_zoom := 0.5
export var max_zoom := 2.0

onready var tween : Tween = $Camera2D/Tween
onready var camera : Camera2D = $Camera2D

enum {ZOOM_UP, ZOOM_DOWN}

var rotation_direction := 1.0
var velocity := Vector2.ZERO

func _physics_process(delta):
	rotation_direction = 0
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		rotation_direction += 1
	if Input.is_action_pressed('left'):
		rotation_direction -= 1
	if Input.is_action_pressed('move'):
		#Second option to move the player
		velocity += transform.x * speed
		#First option to move the player
		"""velocity.x += cos(rotation)
		velocity.y += sin(rotation)
		print("cos(rotation) " + str(cos(rotation)))
		print("sin(rotation) " + str(sin(rotation)))
		print("velocity " + str(velocity))"""
	rotation += rotation_direction * rotation_speed * delta
	#First option to move the player
	#velocity = move_and_slide(velocity.normalized() * speed)
	#Second option to move the player
	velocity = move_and_slide(velocity)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				zoom(ZOOM_UP)
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoom(ZOOM_DOWN)

func zoom(zoom_type : int) -> void:
	var new_zoom := Vector2.ZERO
	if zoom_type == ZOOM_UP:
		new_zoom = camera.zoom * (1-zoom_factor)
	elif  zoom_type == ZOOM_DOWN:
		new_zoom = camera.zoom * (1+zoom_factor)
	new_zoom.x = clamp(new_zoom.x,min_zoom, max_zoom)
	new_zoom.y = clamp(new_zoom.y,min_zoom, max_zoom)
	tween.interpolate_property(camera, "zoom", camera.zoom, 
			new_zoom, zoom_time, 
			tween.TRANS_SINE, tween.EASE_OUT)
	tween.start()
