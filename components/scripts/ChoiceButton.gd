class_name ChoiceButton extends Button

@onready var button: Button= $ChoiceButton

var  choice_index : int

signal choice_selected(choice_index)

func _on_pressed():
	if self.text[-1] == ".":
		Global.point += 3
		print(Global.point)
	choice_selected.emit(choice_index)



	
