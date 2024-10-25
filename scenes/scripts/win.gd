extends Node2D

var havent_cheer = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.progress == 10:
		visible = true
		if havent_cheer:
			$cheers.play()
			get_tree().paused = true
			add_child((load("res://scenes/pause_menu.tscn").instantiate()))
			havent_cheer = false
			Global.win_lose = true
	if Global.current_money < 0:
		get_tree().paused = true
		add_child((load("res://scenes/pause_menu.tscn").instantiate()))
		$YouWIn.text = "YOU LOSE!"
		visible = true
		Global.win_lose = true
