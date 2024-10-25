extends Control

@onready var money = $Label

@onready var blur = $"../ColorRect"
@onready var progress = $TextureProgressBar




func _process(delta: float) -> void:
	money.text = str(Global.current_money)
	progress.value = Global.progress
	if Global._isrestarted:
		get_tree().reload_current_scene()
		Global._isrestarted = false
	
	
	


func _on_button_pressed() -> void:
	if get_tree().paused == false:
		get_tree().paused = true
		add_child((load("res://scenes/pause_menu.tscn").instantiate()))
	else:
		get_tree().paused = false
		
	
