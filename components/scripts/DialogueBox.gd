extends Node2D

@onready var choice_button_scene = preload("res://components/ChoiceButton.tscn")
@onready var choice_container = $DialogueBoxContainer
@onready var question_container = $"../Sprite2D/QuestionContainer"
@onready var ez_dialogue = $"../EzDialogue"

var choice_buttons : Array[Button] = []


func _ready():
	pass	

func add_text(word: String):
	question_container.text = word
	
func clear_dialogue():
	question_container.text = ""
	for choice in choice_buttons:
		choice_container.remove_child(choice)
	choice_buttons = []
	
func add_choice(choice: String):
	var button_obj: ChoiceButton = choice_button_scene.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice
	button_obj.choice_selected.connect(_on_choice_selected)
	choice_container.add_child(button_obj)
	
func _on_choice_selected(choice_index: int):
	print("this is what you choose ", choice_index)
	(ez_dialogue as EzDialogue).next(choice_index)
