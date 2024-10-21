extends Node2D



func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/character_selection.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
