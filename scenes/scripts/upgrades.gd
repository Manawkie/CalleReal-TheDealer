extends Control


var upgrade_cost_1 = 100
var upgrade_cost_2 = 100
var upgrade_cost_3 = 50
var Upgrade_cost_4 = 500
var but1_current_level = 1
var but2_current_level = 1
var but3_current_level = 1
var but4_current_level = 1

@onready var up1_lvl = $buttons/Panel/level1
@onready var up2_lvl = $buttons/Panel/level2
@onready var up3_lvl = $buttons/Panel/level3
@onready var up4_lvl = $buttons/Panel/level4


func _on_but_1_pressed() -> void:
	if but1_current_level != 10:
		if Global.current_money > upgrade_cost_1:
			Global.current_money -= upgrade_cost_1
			upgrade_cost_1 += 100
			Global.coin_gen += 10
			but1_current_level += 1
			up1_lvl.text = "LVL" + str(but1_current_level)


func _on_but_2_pressed() -> void:
	if but2_current_level != 10:
		if Global.current_money > upgrade_cost_2:
			Global.current_money -= upgrade_cost_2
			Global.spawn_time_cd -= 5
			upgrade_cost_2 += 100
			but2_current_level += 1
			up2_lvl.text = "LVL" + str(but2_current_level)


func _on_but_3_pressed() -> void:
	if but3_current_level != 10:
		if Global.current_money > upgrade_cost_3:
			Global.current_money -= upgrade_cost_3
			Global.coin_gen_time -= 0.075
			upgrade_cost_3 += 50
			but3_current_level += 1
			up3_lvl.text = "LVL" + str(but3_current_level)


func _on_but_4_pressed() -> void:
	if but4_current_level != 10:
		if Global.current_money > Upgrade_cost_4:
			Global.current_money -= Upgrade_cost_4
			Global.success_deal += 100
			Upgrade_cost_4 += 250
			
			but4_current_level += 1
			up4_lvl.text = "LVL" + str(but4_current_level)
		
