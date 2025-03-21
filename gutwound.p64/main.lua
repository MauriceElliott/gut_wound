--[[pod_format="raw",created="2024-05-03 13:26:10",modified="2025-03-21 21:52:32",revision=9020]]
include './util.lua'
include './items.lua'
include './input.lua'
include './fillers.lua'
include './types.lua'
include './character.lua'
include './moodles.lua'
include './inventory.lua'
include './static_interactable.lua'
include './containers.lua'
include './context_menu.lua'
include './rooms.lua'
include './scenes.lua'
include './input.lua'
include './camera.lua'
include './fire.lua'

_dbm = ""

function _init()
    -- Update Pallet and font
	poke4(0x5000, get(fetch(pwd().."/pal/0.pal")))
	poke(0x4000, get(fetch"/system/fonts/lil_mono.font"))

	-- Set up environment
	_w_w, _w_h, _tile_size = 480,270, 16
	_coroutines = {}

	-- Set up Mouse
	_m_x, _m_y, _m_b, _m_w_x, _m_w_y, _scroll_inv, _scroll_cont = 0,0,0,0,0,0,0
	_mlb_last_pressed, _mrb_last_pressed, _mmb_last_pressed, _mwyb_last_pressed = nil, nil, nil, nil
	_mp_buffer_time = 0.3

	-- Set up camera
	_c_x, _c_y = 0,0

	-- random bits
	_game_start = false
	_max_items = 5
	_blood_spatter_update = nil

	-- Set up collections
	_fires = {}
	_fire_in_range = ""
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
	_inv=inventory:new({contents = {}})
	_cm=context_menu:new({})
	_char=man:new({})

	-- Initialise static objects
	init_containers()
	init_rooms()
	
	--debug
	light_fire(27, 5)
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
	print("debug: " .. _dbm
		.. " mx, my: " .. _m_x .. " " .. _m_y
		, _c_x-475, _c_y+258, 17)
end
