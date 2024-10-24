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
var _3rd_pos = Vector2(449, 442)
var _4th_pos = Vector2(2036, 940)
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
	
	
	
	if Global.only_spawn_robber:
		npc.texture = robber
	else:
		npc.texture = npc_list[image_index]
	npc.position = starting_pos
	npc.scale = image_scale
	$character/walking.start()
	$DoorSound.play()

func _on_walking_timeout() -> void:
	if walking_stages == 1:
		if npc.position < _2nd_pos:
			npc.position.x += 5.25
			npc.position.y += 2.35
			$character/walking.start()
		else:
			walking_stages += 1
	
	if walking_stages == 2:
		if npc.position.y < _3rd_pos.y:
			npc.position.x -= 0.15
			npc.position.y += 3.925
			$character/walking.start()
		else:
			walking_stages += 1
			
	if walking_stages == 3:
		if npc.position < _4th_pos:
			npc.position.x += 5.6675
			npc.position.y += 1.7785
			$character/walking.start()
		else:
			if npc.texture == robber:
				Global.current_money -= 50
				queue_free()
			else:
				queue_free()
	


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_released("left_click"):
		if npc.texture != robber:
			if Global.can_play_dialogue:
				$character/walking.stop()
				Global.character_image = npc.texture
				$character.queue_free()
				var load_dialogue = load("res://components/Dialogue_handler.tscn")
				var loaded_dialogue = load_dialogue.instantiate()
				add_child(loaded_dialogue)
				Global.can_play_dialogue = false
				await get_tree().create_timer(1.5).timeout
		else:
			$RobberSound.play()
			queue_free()
		
		
