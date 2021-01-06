extends RigidBody2D

onready var sprite: Sprite = $Sprite
onready var camera: Camera2D = $Camera2D


func _ready() -> void:
	camera.current = true


func _physics_process(delta: float) -> void:
	sprite.rotation = linear_velocity.angle()
