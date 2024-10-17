extends Node2D

@onready var world_game = $"../.."
@onready var tutor_man = $tutorial_man
@onready var dialogue_box = $dialogue_box
@onready var dialogues = preload("res://components/Dialogue_handler.tscn")
@onready var dia_handler = $DiaHandler/Dia1
var counter = 0
var player_name: String = "Michael"
var list_of_dialogue = ["Hello! Welcome " + player_name +" we have been waiting for your arrival",
"We badly needed someone like you to dominate the world of businesses",
"Wishing you luck",
""
]


var tutorial_man_pos = 770

func man_entrance():
	if tutor_man.position.y != tutorial_man_pos:
		tutor_man.position.y -= 5
	
	if tutor_man.position.y == tutorial_man_pos:
		if Input.is_action_just_pressed("left_click"):
			dialogue_box.visible = true
			
	


	
func next_dialogue():
	if tutor_man.position.y == tutorial_man_pos:
		dialogue_box.visible = true
		dia_handler.visible = true
		dia_handler.text = list_of_dialogue[counter]
		counter += 1
		
	if counter == 4:
		get_tree().queue_delete(self)
	
	
	

		
				
			

func _process(delta):
	man_entrance()
	
	if Input.is_action_just_pressed("left_click"):
		next_dialogue()
			
			
	
