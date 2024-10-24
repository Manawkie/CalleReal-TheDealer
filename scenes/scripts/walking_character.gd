extends Node2D



@onready var npc = $character

@export var tourist = preload("res://assets/shop_assets/Untitled8_20241023154710.png")
@export var robber = preload("res://assets/shop_assets/Untitled11_20241023150821.png")
@export var gangster = preload("res://assets/shop_assets/Untitled9_20241023150049.png")
@export var granny = preload("res://assets/shop_assets/Untitled10_20241023154653.png")
@export var kid = preload("res://assets/shop_assets/Untitled12_20241023154642.png")

var image_scale = Vector2(0.519, 0.519)
var starting_pos = Vector2(245, 192)
var _2nd_pos = Vector2(455, 285)
var list_of_pos = [Vector2( 2152, 187), Vector2(2152, 427), Vector2(2152, 679), Vector2(2152, 431)]
var list_of_y_pos = [187, 427, 679, 431]
var image_index: int
var walking_stages = 1


var npc_list = []


func _ready() -> void:

	npc_list.append(tourist)
	npc_list.append(granny)
	npc_list.append(kid)
	npc_list.append(robber)
	npc_list.append(gangster)
	image_index = randi() % npc_list.size()
	
	
	
	
	npc.texture = npc_list[image_index]
	npc.position = starting_pos
	npc.scale = image_scale
	$character/walking.start()

func _on_walking_timeout() -> void:
	if walking_stages == 1:
		if npc.position < _2nd_pos:
			npc.position.x += 5.25
			npc.position.y += 2.35
			$character/walking.start()
		else:
			walking_stages += 1
	if walking_stages == 2:
		if npc.position.x < list_of_pos[randi() % list_of_pos.size()].x:
			npc.position.x += 10.60
			if image_index == 0:
				npc.position.y -= 2.45
			if image_index == 1:
				npc.position.y += 7.1
			if image_index == 2:
				npc.position.y += 19.7
			if image_index == 3:
				npc.position.y += 7.3
			
		else:
			queue_free()
	
