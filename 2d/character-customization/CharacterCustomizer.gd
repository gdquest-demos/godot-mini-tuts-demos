extends Control

signal hat_updated(hat)
signal head_updated(head)
signal glasses_updated(glasses)

const hats_dictionary := {"Tall Hat" : "res://Sprites/hat1.png",
						"Birthday Hat" : "res://Sprites/hat2.png",
						"Pirate Hat" : "res://Sprites/hat3.png", }

const glasses_dictionary := {"Star Glasses" : "res://Sprites/sun-glasses1.png",
						"Square Glasses" : "res://Sprites/sun-glasses2.png",
						"Round Glasses" : "res://Sprites/sun-glasses3.png", }
						
const heads_dictionary := {"Medium Circle" : "res://Sprites/medium-circle.png",
						"Medium Square" : "res://Sprites/medium-square.png",
						"Medium Diamond" : "res://Sprites/medium-diamond.png", 
						"Dark Circle" : "res://Sprites/dark-circle.png",
						"Dark Square" : "res://Sprites/dark-square.png",
						"Dark Diamond" : "res://Sprites/dark-diamond.png",
						"Light Circle" : "res://Sprites/light-circle.png",
						"Light Square" : "res://Sprites/light-square.png",
						"Light Diamond" : "res://Sprites/light-diamond.png",}
						
var hat := StreamTexture.new()
var current_hat_idx := 0

var glasses := StreamTexture.new()
var current_glasses_idx := 0

var head := StreamTexture.new()
var current_head_idx := 0

func _ready() -> void:
	update_hat(0)
	update_glasses(0)
	update_head(0)


func update_hat(dir : int) -> void:
	current_hat_idx = (current_hat_idx + dir) % hats_dictionary.size()
	var key = hats_dictionary.keys()[current_hat_idx]
	hat = load(hats_dictionary[key])
	$Panel/VBoxContainer/HatLabel.text = key
	$Panel/VBoxContainer/HBoxContainerHat/Hat.texture = hat
	emit_signal("hat_updated",hat)


func update_glasses(dir : int) -> void:
	current_glasses_idx = (current_glasses_idx + dir) % glasses_dictionary.size()
	var key = glasses_dictionary.keys()[current_glasses_idx]
	glasses = load(glasses_dictionary[key])
	$Panel/VBoxContainer/GlassesLabel.text = key
	$Panel/VBoxContainer/HBoxContainerGlasses/Glasses.texture = glasses
	emit_signal("glasses_updated",glasses)


func update_head(dir : int) -> void:
	current_head_idx = (current_head_idx + dir) % heads_dictionary.size()
	var key = heads_dictionary.keys()[current_head_idx]
	head = load(heads_dictionary[key])
	$Panel/VBoxContainer/HeadLabel.text = key
	$Panel/VBoxContainer/HBoxContainerHead/Head.texture = head
	emit_signal("head_updated",head)

