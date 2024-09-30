--[[pod_format="raw",created="2024-05-05 22:21:00",modified="2024-09-30 22:57:46",revision=7599]]
include './types.lua'
include './util.lua'

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
	inventory = nil
})

man=character:new({
	x=90,
   y=86,
   max_width = 21,
   max_height = 34,
	wound_health = 60,
	delirium = 0,
	d_i_f = {sf = 252, nf = 2, s = 0.5, fl = false},
	u_i_f = {sf = 254, nf = 2, s = 0.5, fl = false},
	l_i_f = {sf = 244, nf = 2, s = 0.5, fl = true},
	r_i_f = {sf = 244, nf = 2, s = 0.5, fl = false},
	d_m_f = {sf = 228, nf = 4, s = 4, fl = false},
	u_m_f = {sf = 236, nf = 4, s = 4, fl = false},
	l_m_f = {sf = 212, nf = 4, s = 4, fl = true},
	r_m_f = {sf = 212, nf = 4, s = 4, fl = false},
})

function move_man(c)
	_btn = btn()
	_w, _a, _s, _d = key("w"), key("a"), key("s"), key("d")
	_none = true
	if (_w or _a or _s or _d) _none = false 
	if _btn != button.none or not _none then
		local speed = c.spd
		if key("shift") then 
			speed*=1.5
			c.anim_spd=1.5
		else
			speed*=1
			c.anim_spd=1
		end
		speed*=c.anim_spd
		c.state, c.start_move = "moving", time()
		c.col_point = { x = (c.x+(c.max_width/2)), y = (c.y+(c.max_height/2)) }
		if _btn == button.right or _d then
			c.i_dir = direction.right
			c.col_point = { x = c.x+c.max_width, y = c.y+(c.max_height/2)}
			c.select_point = { x = (c.x+c.max_width)-8, y = c.y+(c.max_height/2)}
			c.x = c.x + (1 * speed)
			if collide(c) == true then
				c.x = c.x - (1 * speed)
			end
		elseif _btn == button.left or _a then
			c.i_dir = direction.left
			c.col_point =  { x = c.x, y = c.y+(c.max_height/2)}
			c.select_point = { x = c.x+8, y = c.y+(c.max_height/2) }
			c.x = c.x - (1 * speed)
			if collide(c) == true then
				c.x = c.x + (1 * speed)
			end
		elseif _btn == button.down or _s then
			c.i_dir = direction.down
			c.col_point = { x = c.x+(c.max_width/2), y = c.y+c.max_height}
			c.select_point = { x = c.x+(c.max_width/2), y = (c.y+c.max_height)-8 }
			c.y = c.y + (1 * speed)
			if collide(c) == true then
				c.y = c.y - (1 * speed)
			end
		elseif _btn == button.up or _w then
			c.i_dir = direction.up
			c.col_point = { x = c.x+(c.max_width/2), y = c.y}
			c.select_point = { x = c.x+(c.max_width/2), y = (c.y+8) }
			c.y = c.y - (1 * speed)
			if collide(c) == true then
				c.y = c.y + (1 * speed)
			end
		end
		
	else
		c.state = "idle"
		c.col_point = { x = (c.x+(c.max_width/2)), y = (c.y+(c.max_height/2)) }
		c.start_idle = time()
	end
end

function animate_character(c)
	ovalfill(c.x+4, c.y+c.max_height-3, c.x+c.max_width-4, c.y+c.max_height+1, 0)
	if c.state == "idle" then
		if c.i_dir == direction.down then
			animate_sprite(
				c,
				c.d_i_f.sf,
				c.d_i_f.nf,
				c.d_i_f.s,
				c.d_i_f.fl
			)
		elseif c.i_dir == direction.up then
			animate_sprite(
				c,
				c.u_i_f.sf,
				c.u_i_f.nf,
				c.u_i_f.s,
				c.u_i_f.fl
			)
		elseif c.i_dir == direction.left then
			animate_sprite(
				c,
				c.l_i_f.sf,
				c.l_i_f.nf,
				c.l_i_f.s,
				c.l_i_f.fl
			)
		elseif c.i_dir == direction.right then
			animate_sprite(
				c,
				c.r_i_f.sf,
				c.r_i_f.nf,
				c.r_i_f.s,
				c.r_i_f.fl
			)
		end
	end
	if c.state == "moving" then
		if c.i_dir == direction.right then
			animate_sprite(
				c,
				c.r_m_f.sf,
				c.r_m_f.nf,
				c.r_m_f.s,
				c.r_m_f.fl
			)
		elseif c.i_dir == direction.left then
			animate_sprite(
				c,
				c.l_m_f.sf,
				c.l_m_f.nf,
				c.l_m_f.s,
				c.l_m_f.fl
			)
		elseif c.i_dir == direction.down then
			animate_sprite(
				c,
				c.d_m_f.sf,
				c.d_m_f.nf,
				c.d_m_f.s,
				c.d_m_f.fl
			)
		elseif c.i_dir == direction.up then
			animate_sprite(
				c,
				c.u_m_f.sf,
				c.u_m_f.nf,
				c.u_m_f.s,
				c.u_m_f.fl
			)
		end	
	end
end

function scan_character_area(c)
	local current_cel = { x = flr(c.select_point.x/_tile_size), y = flr(c.select_point.y/_tile_size) }
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
--	local bx_co = { x = current_cel.x, y = current_cel.y + 2 }
--	local bx_spr = mget(bx_co.x, bx_co.y)
--	local bx_f = fget(bx_spr)
--	local bxr_co = { x = current_cel.x+1, y = current_cel.y + 2 }
--	local bxr_spr = mget(bxr_co.x, bxr_co.y)
--	local bxr_f = fget(bxr_spr)
--	local bxl_co = { x = current_cel.x-1, y = current_cel.y + 2 }
--	local bxl_spr = mget(bxl_co.x, bxl_co.y)
--	local bxl_f = fget(bxl_spr)
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
--	if bx_f != 0 then
--		add(_flagged_tiles,{ tile_co = bx_co, sprite = bx_spr, flags = bx_f })
--	end	
--	if bxr_f != 0 then
--		add(_flagged_tiles,{ tile_co = bxr_co, sprite = bxr_spr, flags = bxr_f })
--	end	
--	if bxl_f != 0 then
--		add(_flagged_tiles,{ tile_co = bxl_co, sprite = bxl_spr, flags = bxl_f })
--	end	
	if c_f != 0 then
		add(_flagged_tiles,{ tile_co = c_co, sprite = c_spr, flags = c_f })
	end
end

function update_character_vitals(c)
	if c.state == "idle" and c.health < 70 then
		last_update_move, current_update = 0, time_since(start_idle, time(), true)
		if current_update != last_update_idle then
			last_update_idle = current_update
			c.health += 0.05
			c.hunger += 0.01
			c.thirst += 0.02
			if c.wound_health < 50 then
				c.wound_health += 0.01
			end
			if c.pain > 50 then
				c.pain -= 0.05
			end
		end
	end
	if c.state == "moving" then
		last_update_idle, current_update = 0, time_since(start_move, time(), true)
		if current_update != last_update_move then
			last_update_move = current_update
			c.health -= 0.65
			c.wound_health -= 0.25
			c.pain += 0.1
			c.hunger += 0.1
			c.thirst += 0.1
		end
	end
	if c.health < 50 and c.wound_health < 50 then
		if _blood_splatter_update == nil or time_since(_blood_splatter_update, time(), true) > 10 then
			_blood_splatter_update = time()
			add(_blood_splatters, { x = c.x, y = (c.y+c.max_height)-4 })
		end 
		if c.pain > 70 and c.hunger > 50 and c.thirst > 50 then
			last_update_idle, current_update = 0, time_since(start_move, time(), true)
			if current_update != last_update_move then
				last_update_move = current_update
				c.delirium += 0.1
			end
		end
	end
	c.capacity = c.base_capacity + c.extra_capacity
end

function draw_blood_splatter()
	if table_length(_blood_splatters) > 0 then
		for i,b in pairs(_blood_splatters) do
			ovalfill(b.x+5, b.y, b.x+13, b.y+3, 18)
		end
	end
end

function update_equippables(o)
	for i, e in ipairs(o.equipped_items) do
		if e.name == "Backpack" then
			o.inventory.extra_capacity = 12
		end
	end
end