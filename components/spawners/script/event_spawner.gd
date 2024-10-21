extends Node3D


@export var pre_dialogue = preload("res://components/Dialogue_handler.tscn")
@onready var spawner = $".."
var load_dialogue = pre_dialogue.instantiate()
var dialogue_loaded = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dialogue_loaded:
		queue_free()



func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click"):
		
		spawner.add_child(load_dialogue)
		dialogue_loaded = true
		await load_dialogue.ready
		var dia = $Dialogue_handler
		
	
		
		
		
		
	
