--[[pod_format="raw",created="2024-10-04 13:59:46",modified="2025-03-09 23:42:12",revision=517]]
function update_camera()
    _c_x = _char.x + (_w_w/2)
	_c_y = (_char.y + (_w_h/2)) - 270
	_c_y_b = (_char.y + (_w_h/2))
	camera(_char.x - (_w_w/2),_char.y - (_w_h/2))
end