extends Control

@onready var money = $Label

@onready var blur = $"../ColorRect"

func _process(delta: float) -> void:
	money.text = str(Global.current_money)
	
	


func _on_button_pressed() -> void:
	if get_tree().paused == false:
		get_tree().paused = true
		add_child((load("res://scenes/pause_menu.tscn").instantiate()))
	else:
		get_tree().paused = false
		
	
