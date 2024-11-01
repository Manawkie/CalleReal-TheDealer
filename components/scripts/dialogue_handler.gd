extends Control

@export var dialogues_kid: Array[JSON]
@export var dialogues_granny: Array[JSON]
@export var dialogues_gangster: Array[JSON]
@export var dialogues_tourist: Array[JSON]


@onready var state = {
	"player_name": player_name
}
@onready var dia_box_handler = $DialogueBox
@onready var dia_handler = $"."
@onready var question = $Sprite2D/QuestionContainer
var player_name : String = Global.player_name
var point: int = 0





func _ready() -> void:
	if Global.character_image == Global.tourist:
		($EzDialogue as EzDialogue).start_dialogue(dialogues_tourist[randi() % dialogues_tourist.size()], state)
		
	if Global.character_image == Global.kid:
		($EzDialogue as EzDialogue).start_dialogue(dialogues_kid[randi() % dialogues_kid.size()], state)
		
	if Global.character_image == Global.gangster:
		($EzDialogue as EzDialogue).start_dialogue(dialogues_gangster[randi() % dialogues_gangster.size()], state)
	
	if Global.character_image == Global.granny:
		($EzDialogue as EzDialogue).start_dialogue(dialogues_granny[randi() % dialogues_granny.size()], state)
	$talker.texture = Global.character_image
	
	


func _process(delta: float) -> void:
	if question.text == "end":
		Global.current_money += 50
		Global.can_play_dialogue = true
		queue_free()
			
	if question.text == "sale":
		Global.progress += 1
		Global.current_money += 100
		Global.can_play_dialogue = true
		queue_free()
		
	if question.text == "sale+":
		Global.progress += 1
		Global.current_money += 150
		Global.can_play_dialogue = true
		queue_free()
	
	if question.text == "aws":
		Global.progress -= 1
		Global.current_money -= 50
		Global.can_play_dialogue = true
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
	
