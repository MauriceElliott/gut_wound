--[[pod_format="raw",created="2024-10-04 13:59:46",modified="2024-11-18 23:49:51",revision=291]]
function update_camera()
    _c_x = _char.x + (_w_w/2)
	_c_y = (_char.y + (_w_h/2)) - 270
	_c_y_b = (_char.y + (_w_h/2))
	camera(_char.x - (_w_w/2),_char.y - (_w_h/2))
end