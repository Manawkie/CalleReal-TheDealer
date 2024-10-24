extends Node2D


@onready var main_table = $MainTable

var randomizer = randi() % 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Spawn_time.start()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		spawn_npc_buyer()
	if Input.is_action_just_pressed("mid"):
		spawn_npc_walker()
	
	if Input.is_action_just_pressed("spawn_robber"):
		if Global.only_spawn_robber:
			Global.only_spawn_robber = false
		else:
			Global.only_spawn_robber = true
	
	if Input.is_action_just_pressed("spawn"):
		spawn_npc_buyer()
		
func spawn_npc_buyer():
	var preload_npc = load("res://components/characters/character.tscn")
	var loaded_npc = preload_npc.instantiate()
	add_child(loaded_npc)
	

func spawn_npc_walker():
	add_child((load("res://scenes/walking_character.tscn")).instantiate())

func spawn_robber():
	pass

func _on_spawn_time_timeout() -> void:
	spawn_npc_buyer()
	$Spawn_time.wait_time = randi() % 10
	$Spawn_time.start()




func _on_item_1_mouse_entered() -> void:
	$items_forsale/item1/Panel.visible = true
	$items_forsale/item1/Label.visible = true

func _on_item_1_mouse_exited() -> void:
	$items_forsale/item1/Panel.visible = false
	$items_forsale/item1/Label.visible = false


func _on_item_2_mouse_entered() -> void:
	$items_forsale/item2/Panel.visible = true
	$items_forsale/item2/Label.visible = true


func _on_item_2_mouse_exited() -> void:
	$items_forsale/item2/Panel.visible = false
	$items_forsale/item2/Label.visible = false


func _on_item_3_mouse_entered() -> void:
	$items_forsale/item3/Panel.visible = true
	$items_forsale/item3/Label.visible = true

func _on_item_3_mouse_exited() -> void:
	$items_forsale/item3/Panel.visible = false
	$items_forsale/item3/Label.visible = false


func _on_item_4_mouse_entered() -> void:
	$items_forsale/item4/Panel.visible = true
	$items_forsale/item4/Label.visible = true


func _on_item_4_mouse_exited() -> void:
	$items_forsale/item4/Panel.visible = false
	$items_forsale/item4/Label.visible = false
