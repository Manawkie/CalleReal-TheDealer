extends Node

@export var tourist = preload("res://assets/shop_assets/Untitled8_20241023154710.png")
@export var robber = preload("res://assets/shop_assets/Untitled11_20241023150821.png")
@export var gangster = preload("res://assets/shop_assets/Untitled9_20241023150049.png")
@export var granny = preload("res://assets/shop_assets/Untitled10_20241023154653.png")
@export var kid = preload("res://assets/shop_assets/Untitled12_20241023154642.png")

var current_money = 200
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



		
var character_image 
var can_play_dialogue = true
var progress = 0
var only_spawn_robber = false
