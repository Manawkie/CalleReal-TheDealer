extends Control

@export var dialogue_json : JSON
@export var list_of_dialogue: Array[JSON]
@onready var state = {
	"player_name": player_name
}
@onready var dia_box_handler = $DialogueBox
@onready var character_load = preload("res://scenes/character_selection.tscn")
var player_name : String = ""




func _ready() -> void:
	pass
	


func _process(delta: float) -> void:
	#if character_load.is_name_available == true:
		#character_name = character_load.character_name
		#character_load.is_name_available = false
		pass


func _on_ez_dialogue_dialogue_generated(response: DialogueResponse) -> void:
	dia_box_handler.clear_dialogue()
	dia_box_handler.add_text(response.text)
	
	if response.choices.is_empty():
		dia_box_handler.add_choice("...")
	else:	
		for choice in response.choices:
			dia_box_handler.add_choice(choice)


func _on_ez_dialogue_custom_signal_received(value: Variant) -> void:
	if value == "done":
		pass
	pass # Replace with function body.
	
func start_dialogue(dialogue):
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)
