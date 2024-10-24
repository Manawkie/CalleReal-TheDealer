extends Node2D

@onready var input_field = $LineEdit
var is_name_available = false
var character_name: String = ""


func _on_next_pressed():
	Global.player_name = input_field.text
	get_tree().change_scene_to_file("res://scenes/my_shop.tscn")
