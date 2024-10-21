extends Control

@export var list_of_dialogue: Array[JSON]
@onready var state = {
	"player_name": player_name
}
@onready var dia_box_handler = $DialogueBox
@onready var dia_handler = $"."
@onready var question = $DialogueBox/QuestionContainer
@onready var character_load = preload("res://scenes/character_selection.tscn")
var player_name : String = Global.player_name
var point: int = 0





func _ready() -> void:
	($EzDialogue as EzDialogue).start_dialogue(list_of_dialogue[randi() % list_of_dialogue.size()], state)
	


func _process(delta: float) -> void:
	if question.text == "end":
		if Global.point >= 5:
			Global.current_money += 100
			Global.point = 0
			
		else:
			if randi() % 10 >= 5:
				Global.current_money -= 50
				Global.point = 0
				
		queue_free()
		
	


func _on_ez_dialogue_dialogue_generated(response: DialogueResponse) -> void:
	dia_box_handler.clear_dialogue()
	dia_box_handler.add_text(response.text)
	
	if response.choices.is_empty():
		dia_box_handler.add_choice("...")
	else:	
		for choice in response.choices:
			dia_box_handler.add_choice(choice)


func _on_ez_dialogue_custom_signal_received(value: Variant) -> void:
	print(value)
	
