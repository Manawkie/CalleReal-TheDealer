extends Control

@onready var money = $Label


func _process(delta: float) -> void:
	money.text = str(Global.current_money)
	
	
