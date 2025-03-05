--[[pod_format="raw",created="2024-10-04 13:59:11",modified="2025-03-05 00:21:12",revision=390]]
function update_mouse_input()
	_m_x, _m_y, _m_b, _m_w_x, _m_w_y = mouse()
	_m_x = _m_x + (_c_x - _w_w)
	_m_y = _m_y + _c_y
	if ((_m_b&1>0) and _mlb_last_pressed == nil)
	or ((_m_b&1>0) and time_since(_mlb_last_pressed,time(),false) > _mp_buffer_time) then
		_mlb_last_pressed = time()
		_m_l_b=true
	else
		_m_l_b=false
	end
	if ((_m_b&2>0) and _mrb_last_pressed == nil)
	or ((_m_b&2>0) and time_since(_mrb_last_pressed,time(),false) > _mp_buffer_time) then
		_mrb_last_pressed = time()
		_m_r_b=true
	else
		_m_r_b=false
	end
	if ((_m_w_y>0 or _m_w_y<0) and _mwyb_last_pressed == nil)
	or ((_m_w_y>0 or _m_w_y<0) and time_since(_mwyb_last_pressed,time(),false) > _mp_buffer_time) then
		_mrb_last_pressed = time()
		local _m_w_y = _m_w_y * -1
		_m_w_y_b = true
	else
		_m_w_y_b = false
	end
end
