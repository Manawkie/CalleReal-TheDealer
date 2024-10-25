extends Control


var time: float = 0.0
var minutes: int = 0
var second: int = 0
var msec: int = 0



func _process(delta: float) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	second = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Panel/Minutes.text = "%02d:" % minutes
	$Panel/Seconds.text = "%02d:" % second
	$Panel/Msecs.text = "%02d:" % msec
	
	if Global.win_lose:
		stop()
		Global.best_time = get_time_score()
	

	
func stop():
	set_process(false)

func start():
	set_process(true)

func get_time_score():
	return "%02d:%02d.%03d" % [minutes, second, msec]
