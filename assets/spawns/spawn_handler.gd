extends Node3D


func _ready() -> void:
	$Spawn_time.start()

func spawn():
	var spawned_scene = load("res://components/spawners/event_spawner.tscn")
	var spawned_scene_ins = spawned_scene.instantiate()
	spawned_scene_ins.position.x = randi() % 40
	spawned_scene_ins.position.y = 12
	spawned_scene_ins.position.z = randi() % 40
	add_child(spawned_scene_ins)
	
	
func _process(delta: float) -> void:
	$Spawn_time.wait_time = Global.spawn_time_cd


func _on_spawn_time_timeout() -> void:
	spawn()
	$Spawn_time.start()
