extends Node3D
 
const MOVE_MARGIN = 20
const MOVE_SPEED = 30
 
const ray_length = 1000
@onready var cam = $camera
 
func _process(delta):
	var m_pos = get_viewport().get_mouse_position()
	calc_move(m_pos, delta)
 
func calc_move(m_pos, delta):
	var v_size = get_viewport().size
	var move_vec = Vector3()
	const max_y_value = 5000
	const min_y_value = 500
	var cur_y_value = 1500
 
	if m_pos.x < MOVE_MARGIN:
		if Global.max_left > 0:
			Global.max_left -= 5
			Global.max_right -= 5
			move_vec.x -= 5
			move_vec.z -= 2.5
	if m_pos.y < MOVE_MARGIN:
		if Global.max_down > 0:
			Global.max_down -= 5
			Global.max_up -= 5
			move_vec.z -= 5
			move_vec.x += 2.5
	if m_pos.x > v_size.x - MOVE_MARGIN:
		if Global.max_right < 1000:
			Global.max_right += 5
			Global.max_left += 5
			move_vec.x += 5
			move_vec.z += 2.5
	if m_pos.y > v_size.y - MOVE_MARGIN:
		if Global.max_up < 1000:
			Global.max_up += 5
			Global.max_down += 5
			move_vec.z += 5
			move_vec.x -= 2.5
	if Input.is_action_just_released("zoom_in"):
		if Global.max_height > 0:
			Global.max_height -= 50
			move_vec.y -= 50
			cur_y_value -= 50
	
	if Input.is_action_just_released("zoom_out"):
		if Global.max_height < 400:
			Global.max_height += 50
			move_vec.y += 50
			cur_y_value += 50
			
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation_degrees.y)
	global_translate(move_vec * delta * MOVE_SPEED)
	


 
