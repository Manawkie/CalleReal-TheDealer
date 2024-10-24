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
		
func spawn_npc_buyer():
	var preload_npc = load("res://components/characters/character.tscn")
	var loaded_npc = preload_npc.instantiate()
	add_child(loaded_npc)
	
	





func _on_spawn_time_timeout() -> void:
	spawn_npc_buyer()
	$Spawn_time.wait_time = randi() % 10
	$Spawn_time.start()
