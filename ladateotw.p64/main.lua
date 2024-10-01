--[[pod_format="raw",created="2024-05-03 13:26:10",modified="2024-10-01 23:21:28",revision=7827]]
include './util.lua'
include './character.lua'
include './moodles.lua'
include './inventory.lua'
include './static_interactable.lua'
include './containers.lua'
include './context_menu.lua'
include './rooms.lua'

_debug_message = ""


function _init()
	poke4(0x5000, get(fetch(pwd().."/pal/0.pal")))
	poke(0x4000,get(fetch"/system/fonts/lil_mono.font"))
	_w_w, _w_h = 480,270
	_m_x, _m_y, _m_b, _m_w_x, _m_w_y, _scroll_inv, _scroll_cont = 0,0,0,0,0,0,0
	_c_x = 0
	_c_y = 0
	_tile_size = 16
	_buffer_time = 0.3
	_max_items = 5
	_mlb_last_pressed = nil
	_mrb_last_pressed = nil
	_mmb_last_pressed = nil
	_mwyb_last_pressed = nil
	_coroutines = {}
	c=man:new({})
	_blood_spatter_update = nil
	_blood_splatters = {}
	_redraw_list = {}
	m={moodles={}}
	_flagged_tiles = {}
	i=inventory:new({contents = {}})
	_cm=context_menu:new({})
	_containers = {}
	_rooms = {}
	_discovered_containers = {}
	_fog={}
	init_containers()
	init_rooms()
	c.inventory = i
end

function _draw()
	_c_x = c.x + (_w_w/2)
	_c_y = (c.y + (_w_h/2)) - 270
	_c_y_b = (c.y + (_w_h/2))
	cls(0)
	camera(c.x - (_w_w/2),c.y - (_w_h/2))
	map()
	draw_fow()
	display_moodles(m,c)
	update_interactables(i, c)
	draw_blood_splatter()
	animate_character(c)
	redraw_tiles(c)
	update_inventory(i)
	draw_context_menu()
	draw_border()
	debug()
	update_coroutines()
--title_screen()
end

function update_coroutines()
	for c in all(_coroutines) do
		if costatus(c) then
			coresume(c)
    	else
    		del(_coroutines,c)
    	end
    end
end

function _update()
	update_mouse_input()
	move_man(c)
	scan_character_area(c)
	execute_context_menu_option(c, 25)
	update_character_vitals(c)
end

function title_screen()
	cls(16)
	spr(gfx_offset.gfx_3+49, 250, 20)
	spr(gfx_offset.gfx_3+48, 15, 20)
end

function update_mouse_input()
	_m_x, _m_y, _m_b, _m_w_x, _m_w_y = mouse()
	_m_x = _m_x + (_c_x - _w_w)
	_m_y = _m_y + _c_y
	if ((_m_b&1>0) and _mlb_last_pressed == nil) 
	or ((_m_b&1>0) and time_since(_mlb_last_pressed,time(),false) > _buffer_time) then
		_mlb_last_pressed = time()
		_m_l_b=true
	else
		_m_l_b=false
	end
	if ((_m_b&2>0) and _mrb_last_pressed == nil) 
	or ((_m_b&2>0) and time_since(_mrb_last_pressed,time(),false) > _buffer_time) then
		_mrb_last_pressed = time()
		_m_r_b=true
	else
		_m_r_b=false
	end
	if ((_m_w_y>0 or _m_w_y<0) and _mwyb_last_pressed == nil) 
	or ((_m_w_y>0 or _m_w_y<0) and time_since(_mwyb_last_pressed,time(),false) > _buffer_time) then
		_mrb_last_pressed = time()
		local _m_w_y = _m_w_y * -1
		_m_w_y_b = true
	else
		_m_w_y_b = false
	end
end

function debug()
--	circfill(c.select_point.x, c.select_point.y,2)
--	rect(c.d_x1, c.d_y1, c.d_x2, c.d_y2, 2)
	print("debug_message: " .. _debug_message
			.. " cpu1: " .. stat(1)
			.. " cpu2: " .. stat(2), _c_x-475, _c_y+258, 31)
end