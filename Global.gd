extends Node


var current_money = 99999
var player_name = ""
var max_right = 500
var max_left = 500
var max_up = 500
var max_down = 500
var max_height = 100
var point = 0



#upgrades
var coin_gen = 10
var coin_gen_time = 1
var spawn_time_cd = 60
var success_deal = 100


func _process(delta: float) -> void:
	if current_money > 10000:
		win()
		
		
func win():
	pass
