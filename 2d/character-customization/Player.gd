extends KinematicBody2D

export var speed := 300.0

onready var body := $Body
onready var hat := $Body/Hat
onready var glasses := $Body/Glasses
onready var head := $Body/Head


func _physics_process(_delta) -> void:
	var direction := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	move_and_slide(direction * speed)

	if direction.x != 0:
		body.scale.x = sign(direction.x)


func _on_CharacterCustomizer_glasses_changed(texture) -> void:
	glasses.texture = texture


func _on_CharacterCustomizer_hat_changed(texture) -> void:
	hat.texture = texture


func _on_CharacterCustomizer_head_changed(texture) -> void:
	head.texture = texture
