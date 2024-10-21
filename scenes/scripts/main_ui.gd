extends Control


@onready var upgrades = $"../Upgrades"

func _on_menu_pressed() -> void:
	if upgrades.visible:
		upgrades.visible = false
	else:
		upgrades.visible = true
	
	
