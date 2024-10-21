extends Control

@onready var money_ui = $"../MoneyUi"


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	$Timer.wait_time = Global.coin_gen_time
	if $Pbar.value == 10:
		$Pbar.value = 0
		Global.current_money += Global.coin_gen
	



func _on_timer_timeout() -> void:
	add_points_to_bar()
	
func add_points_to_bar():
	
	$Pbar.value += 1

func _on_pbar_changed() -> void:
	if $Pbar.value == 10:
		$Pbar.value = 0



func _on_button_button_down() -> void:
	$Timer.start()


func _on_button_button_up() -> void:
	$Timer.stop()
