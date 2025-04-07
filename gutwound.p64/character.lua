--[[pod_format="raw",created="2024-05-05 22:21:00",modified="2025-04-07 22:24:30",revision=9611]]

character=entity:new({
   col_point = { x=0, y=0 },
   select_point = { x=0, y=0},
	i_dir = direction.down,
	spd=0.60,
	anim_spd=1,
	health = 60,
	pain = 10,
	hunger = 10,
	thirst = 50,
	state = "idle",
	start_idle = nil,
	start_move = nil,
	equipped_items = {},
	inventory = nil,
	is_warmed_up = false,
})

man=character:new({
	x=100,
   y=90,
   max_width = 21,
   max_height = 34,
	wound_health = 60,
	delirium = 0,
	d_i_f = {sf = (gfx_offset.gfx_1+32), nf = 2, s = 0.5, fl = false},
	u_i_f = {sf = (gfx_offset.gfx_1+40), nf = 2, s = 0.5, fl = false},
	l_i_f = {sf = (gfx_offset.gfx_1+24), nf = 2, s = 0.5, fl = true},
	r_i_f = {sf = (gfx_offset.gfx_1+24), nf = 2, s = 0.5, fl = false},
	d_m_f = {sf = (gfx_offset.gfx_1+8), nf = 4, s = 4, fl = false},
	u_m_f = {sf = (gfx_offset.gfx_1+16), nf = 4, s = 4, fl = false},
	l_m_f = {sf = (gfx_offset.gfx_1+0), nf = 4, s = 4, fl = true},
	r_m_f = {sf = (gfx_offset.gfx_1+0), nf = 4, s = 4, fl = false},
	db_i_f = {sf = (gfx_offset.gfx_1+38), nf = 2, s = 0.5, fl = false},
	ub_i_f = {sf = (gfx_offset.gfx_1+46), nf = 2, s = 0.5, fl = false},
	lb_i_f = {sf = (gfx_offset.gfx_1+30), nf = 2, s = 0.5, fl = true},
	rb_i_f = {sf = (gfx_offset.gfx_1+30), nf = 2, s = 0.5, fl = false},
	db_m_f = {sf = (gfx_offset.gfx_1+12), nf = 4, s = 4, fl = false},
	ub_m_f = {sf = (gfx_offset.gfx_1+20), nf = 4, s = 4, fl = false},
	lb_m_f = {sf = (gfx_offset.gfx_1+4), nf = 4, s = 4, fl = true},
	rb_m_f = {sf = (gfx_offset.gfx_1+4), nf = 4, s = 4, fl = false},
})

function move_man()
	_btn = btn()
	_w, _a, _s, _d = key("w"), key("a"), key("s"), key("d")
	_none = true
	if (_w or _a or _s or _d) _none = false
	if _btn != button.none or not _none then
		local speed = _char.spd
		if key("shift") then
			speed*=1.5
			_char.anim_spd=1.5
		else
			speed*=1
			_char.anim_spd=1
		end
		speed*=_char.anim_spd
		_char.state, _char.start_move = "moving", time()
		_char.col_point = { x = (_char.x+(_char.max_width/2)), y = (_char.y+(_char.max_height/2)) }
		if _btn == button.right or _d then
			_char.i_dir = direction.right
			_char.col_point = { x = _char.x+_char.max_width, y = _char.y+(_char.max_height/2)}
			_char.select_point = { x = (_char.x+_char.max_width)-8, y = _char.y+(_char.max_height/2)}
			_char.x = _char.x + (1 * speed)
			if collide(c) == true then
				_char.x = _char.x - (1 * speed)
			end
		elseif _btn == button.left or _a then
			_char.i_dir = direction.left
			_char.col_point =  { x = _char.x, y = _char.y+(_char.max_height/2)}
			_char.select_point = { x = _char.x+8, y = _char.y+(_char.max_height/2) }
			_char.x = _char.x - (1 * speed)
			if collide(c) == true then
				_char.x = _char.x + (1 * speed)
			end
		elseif _btn == button.down or _s then
			_char.i_dir = direction.down
			_char.col_point = { x = _char.x+(_char.max_width/2), y = _char.y+_char.max_height}
			_char.select_point = { x = _char.x+(_char.max_width/2), y = (_char.y+_char.max_height)-8 }
			_char.y = _char.y + (1 * speed)
			if collide(c) == true then
				_char.y = _char.y - (1 * speed)
			end
		elseif _btn == button.up or _w then
			_char.i_dir = direction.up
			_char.col_point = { x = _char.x+(_char.max_width/2), y = _char.y}
			_char.select_point = { x = _char.x+(_char.max_width/2), y = (_char.y+8) }
			_char.y = _char.y - (1 * speed)
			if collide(c) == true then
				_char.y = _char.y + (1 * speed)
			end
		end
	else
		_char.state = "idle"
		_char.col_point = { x = (_char.x+(_char.max_width/2)), y = (_char.y+(_char.max_height/2)) }
		_char.start_idle = time()
	end
end

function animate_character()
	ovalfill(_char.x+4, _char.y+_char.max_height-3, _char.x+_char.max_width-5, _char.y+_char.max_height+1, 16)
	if _wub > 1 then
		spr(gfx_offset.gfx_3+14, _char.x-2, _char.y-2)
	end
	local bkpk = util.name_contains(_char.equipped_items, "Backpack")
	if _char.state == "idle" then
		if bkpk.check == false then
			if _char.i_dir == direction.down then
				animate_sprite(
					_char,
					_char.d_i_f.sf,
					_char.d_i_f.nf,
					_char.d_i_f.s,
					_char.d_i_f.fl
				)
			elseif _char.i_dir == direction.up then
				animate_sprite(
					_char,
					_char.u_i_f.sf,
					_char.u_i_f.nf,
					_char.u_i_f.s,
					_char.u_i_f.fl
				)
			elseif _char.i_dir == direction.left then
				animate_sprite(
					_char,
					_char.l_i_f.sf,
					_char.l_i_f.nf,
					_char.l_i_f.s,
					_char.l_i_f.fl
				)
			elseif _char.i_dir == direction.right then
				animate_sprite(
					_char,
					_char.r_i_f.sf,
					_char.r_i_f.nf,
					_char.r_i_f.s,
					_char.r_i_f.fl
				)
			end
		else
			if _char.i_dir == direction.down then
				animate_sprite(
					_char,
					_char.db_i_f.sf,
					_char.db_i_f.nf,
					_char.db_i_f.s,
					_char.db_i_f.fl
				)
			elseif _char.i_dir == direction.up then
				animate_sprite(
					_char,
					_char.ub_i_f.sf,
					_char.ub_i_f.nf,
					_char.ub_i_f.s,
					_char.ub_i_f.fl
				)
			elseif _char.i_dir == direction.left then
				animate_sprite(
					_char,
					_char.lb_i_f.sf,
					_char.lb_i_f.nf,
					_char.lb_i_f.s,
					_char.lb_i_f.fl
				)
			elseif _char.i_dir == direction.right then
				animate_sprite(
					_char,
					_char.rb_i_f.sf,
					_char.rb_i_f.nf,
					_char.rb_i_f.s,
					_char.rb_i_f.fl
				)
			end
		end	
	end
	if _char.state == "moving" then
		if bkpk.check == false then
			if _char.i_dir == direction.right then
				animate_sprite(
					_char,
					_char.r_m_f.sf,
					_char.r_m_f.nf,
					_char.r_m_f.s,
					_char.r_m_f.fl
				)
			elseif _char.i_dir == direction.left then
				animate_sprite(
					_char,
					_char.l_m_f.sf,
					_char.l_m_f.nf,
					_char.l_m_f.s,
					_char.l_m_f.fl
				)
			elseif _char.i_dir == direction.down then
				animate_sprite(
					_char,
					_char.d_m_f.sf,
					_char.d_m_f.nf,
					_char.d_m_f.s,
					_char.d_m_f.fl
				)
			elseif _char.i_dir == direction.up then
				animate_sprite(
					_char,
					_char.u_m_f.sf,
					_char.u_m_f.nf,
					_char.u_m_f.s,
					_char.u_m_f.fl
				)
			end
		else
			if _char.i_dir == direction.right then
				animate_sprite(
					_char,
					_char.rb_m_f.sf,
					_char.rb_m_f.nf,
					_char.rb_m_f.s,
					_char.rb_m_f.fl
				)
			elseif _char.i_dir == direction.left then
				animate_sprite(
					_char,
					_char.lb_m_f.sf,
					_char.lb_m_f.nf,
					_char.lb_m_f.s,
					_char.lb_m_f.fl
				)
			elseif _char.i_dir == direction.down then
				animate_sprite(
					_char,
					_char.db_m_f.sf,
					_char.db_m_f.nf,
					_char.db_m_f.s,
					_char.db_m_f.fl
				)
			elseif _char.i_dir == direction.up then
				animate_sprite(
					_char,
					_char.ub_m_f.sf,
					_char.ub_m_f.nf,
					_char.ub_m_f.s,
					_char.ub_m_f.fl
				)
			end	
		end
	end
end

function scan_character_area()
	local current_cel = { x = flr(_char.select_point.x/_tile_size), y = flr(_char.select_point.y/_tile_size) }
	local tr_co = { x = current_cel.x + 1, y = current_cel.y - 1 }
	local tr_spr = mget(tr_co.x, tr_co.y)
	local tr_f = fget(tr_spr)
	local tl_co = { x = current_cel.x - 1, y = current_cel.y - 1 }
	local tl_spr = mget(tl_co.x, tl_co.y)
	local tl_f = fget(tl_spr)
	local t_co = { x = current_cel.x, y = current_cel.y - 1 }
	local t_spr = mget(t_co.x, t_co.y)
	local t_f = fget(t_spr)
	local r_co = { x = current_cel.x + 1, y = current_cel.y }
	local r_spr = mget(r_co.x, r_co.y)
	local r_f = fget(r_spr)
	local l_co = { x = current_cel.x - 1, y = current_cel.y }
	local l_spr = mget(l_co.x, l_co.y)
	local l_f = fget(l_spr)
	local br_co = { x = current_cel.x + 1, y = current_cel.y + 1 }
	local br_spr = mget(br_co.x, br_co.y)
	local br_f = fget(br_spr)
	local bl_co = { x = current_cel.x - 1, y = current_cel.y +1 }
	local bl_spr = mget(bl_co.x, bl_co.y)
	local bl_f = fget(bl_spr)
	local b_co = { x = current_cel.x, y = current_cel.y + 1 }
	local b_spr = mget(b_co.x, b_co.y)
	local b_f = fget(b_spr)
	local c_co = { x = current_cel.x, y = current_cel.y }
	local c_spr = mget(c_co.x, c_co.y)
	local c_f = fget(c_spr)

	if tr_f != 0 then
		add(_flagged_tiles,{ tile_co = tr_co, sprite = tr_spr, flags = tr_f })
	end
	if tl_f != 0 then
		add(_flagged_tiles,{ tile_co = tl_co, sprite = tl_spr, flags = tl_f })
	end
	if t_f != 0 then
		add(_flagged_tiles,{ tile_co = t_co, sprite = t_spr, flags = t_f })
	end
	if r_f != 0 then
		add(_flagged_tiles,{ tile_co = r_co, sprite = r_spr, flags = r_f })
	end
	if l_f != 0 then
		add(_flagged_tiles,{ tile_co = l_co, sprite = l_spr, flags = l_f })
	end
	if br_f != 0 then
		add(_flagged_tiles,{ tile_co = br_co, sprite = br_spr, flags = br_f })
	end
	if bl_f != 0 then
		add(_flagged_tiles,{ tile_co = bl_co, sprite = bl_spr, flags = bl_f })
	end
	if b_f != 0 then
		add(_flagged_tiles,{ tile_co = b_co, sprite = b_spr, flags = b_f })
	end
	if c_f != 0 then
		add(_flagged_tiles,{ tile_co = c_co, sprite = c_spr, flags = c_f })
	end
end

--health
_cv_i_h = 0.05
--wound health
_cv_i_wh = 0.05
--hunger
_cv_i_hh = 0.05
--thirst
_cv_i_t = 0.05
--pain
_cv_i_p = 0.05

function update_character_vitals()
--[[
		If character is in range of fire add increase modifier to vital improvements
		Especially delirium, health, and fatigue
		Wound health should get a minor buff.
		Thirst and hunger should get no buff.
]]
	if _char.state == "idle" and _char.health < 70 then
		last_update_move, current_update = 0, time_since(start_idle, time(), true)
		if current_update != last_update_idle then
			last_update_idle = current_update
			_char.health += (_cv_i_h*_wub)
			_char.hunger += (_cv_i_hh/_wub)
			_char.thirst += (_cv_i_t/_wub)
			if _char.wound_health < 50 then
				_char.wound_health += (_cv_i_wh*_wub)
			end
			if _char.pain > 50 then
				_char.pain -= (_cv_i_p*_wub)
			end
		end
	end
	if _char.state == "moving" then
		last_update_idle, current_update = 0, time_since(start_move, time(), true)
		if current_update != last_update_move then
			last_update_move = current_update
			_char.health -= 0.65
			_char.wound_health -= 0.25
			_char.pain += 0.1
			_char.hunger += 0.1
			_char.thirst += 0.1
		end
	end
	if _char.health < 50 and _char.wound_health < 50 then
		if _blood_splatter_update == nil or time_since(_blood_splatter_update, time(), true) > 10 then
			_blood_splatter_update = time()
			add(_blood_splatters, { x = _char.x, y = (_char.y+_char.max_height)-4 })
		end
		if _char.pain > 70 and _char.hunger > 50 and _char.thirst > 50 then
			last_update_idle, current_update = 0, time_since(start_move, time(), true)
			if current_update != last_update_move then
				last_update_move = current_update
				_char.delirium += 0.1
			end
		end
	end
end

function draw_blood_splatter()
	if table_length(_blood_splatters) > 0 then
		for i,b in pairs(_blood_splatters) do
			ovalfill(b.x+5, b.y, b.x+13, b.y+3, 18)
		end
	end
end

function update_equippables()
	local bkpk = util.name_contains(_char.equipped_items,"Backpack")
	if bkpk.check then
		_char.bkpk_equipped = true
		_inv.extra_capacity = 12
	else
		_char.bkpk_equipped = false
		_inv.extra_capacity = 0
	end
	_inv.max_capacity = _inv.capacity + _inv.extra_capacity
end
