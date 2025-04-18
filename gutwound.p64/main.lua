--[[pod_format="raw",created="2024-05-03 13:26:10",modified="2025-04-18 21:48:56",revision=10532]]
include './util.lua'
include './sobjects.lua'
include './character.lua'
include './moodles.lua'
include './inventory.lua'
include './map_tiles.lua'
include './cmenu.lua'
include './rooms.lua'
include './scenes.lua'
include './fire.lua'

_dbm = nil
_dbo = nil

function _init()
    -- Update Pallet and font
	poke4(0x5000, get(fetch(pwd().."/pal/0.pal")))
	poke(0x4000, get(fetch"/system/fonts/lil_mono.font"))

	-- Set up environment
	_w_w, _w_h, _tile_size = 480, 270, 16
	_coroutines = {}

	-- Set up Mouse
	_m_x, _m_y, _m_b, _m_w_x, _m_w_y, _scroll_inv, _scroll_cont = 0,0,0,0,0,0,0
	_mlb_last_pressed, _mrb_last_pressed, _mmb_last_pressed, _mwyb_last_pressed = nil, nil, nil, nil
	-- Mouse press buffer time (to avoid multi click in a single click)
	_mp_buffer_time = 0.3

	-- Set up camera
	_c_x, _c_y = 0,0

	-- random bits
	_game_start = false
	_max_items = 5
	_blood_spatter_update = nil

	-- Set up collections
	_fires = {}
	_fire_in_range = nil
	_in_range_lit_fire = nil
	_blood_splatters = {}
	_fires = {}
	_redraw_list = {}
	_moodles={}
	_flagged_tiles = {}
	_containers = {}
	_rooms = {}
	_discovered_containers = {}
	_fog={}

	-- major objects
	_inv=inventory:new({contents = {container_slot:new({ item = lighter:new({})})}})
	add(_inv.contents, container_slot:new({ item = letter:new({})}))
	_cm=context_menu:new({})
	_char=man:new({})

	-- Initialise static objects
	init_containers()
	init_rooms()
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

function _draw()
	if _game_start == false then
		title_scene_draw()
		debug()
	else
   	game_scene_draw()
   	debug()
   end
	update_coroutines()
	debug()
end

function _update()
   game_scene_update()
	update_mouse_input()
end

function debug()
	if _dbo != nil then
		print(_dbo, _c_x-478, _c_y+10, 17)
		_dbo = nil
	elseif _dbm != nil then
		_dbm = _dbm .. " mx, my: " .. _m_x .. " " .. _m_y
		print("debug: " .. _dbm
			, _c_x-475, _c_y+258, 17)
	end
end
