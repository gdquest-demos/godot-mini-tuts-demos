extends Node2D

onready var fps_label := $CanvasLayer/FPS
onready var sfx1 := $SFX1
onready var sfx2 := $SFX2
onready var sfx3 := $SFX3


func _physics_process(delta) -> void:
	fps_label.text = "FPS: " + str(Engine.get_frames_per_second())


func _on_SFX1_pressed() -> void:
	sfx1.play()


func _on_SFX2_pressed() -> void:
	sfx2.play()


func _on_SFX3_pressed() -> void:
	sfx3.play()
