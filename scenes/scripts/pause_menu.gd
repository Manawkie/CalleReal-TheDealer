extends Control


@onready var siself = $"."


func _ready() -> void:
	$AnimationPlayer.play("blur")

func _on_button_pressed() -> void:
	get_tree().paused = false
	siself.queue_free()




func _on_button_2_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_button_3_pressed() -> void:
	get_tree().paused = false
	queue_free()
	Global.progress = 0
	Global.current_money = 200
	Global._isrestarted = true
	get_tree().reload_current_scene()
	

	
	
