--[[pod_format="raw",created="2024-05-03 22:03:54",modified="2025-03-16 23:44:05",revision=7674]]
util = {}

--object, start frame,
--num frames, speed, flip
function animate_sprite(o, sf, nf, sp, fl)
	if(not o.a_la) o.a_la = sf
	if(not o.a_ct) o.a_ct = 0
	if(not o.a_st) o.a_st = 0
	if(not o.fl) o.fl = false
	o.a_ct += 1
	if o.a_ct % (60/(sp*o.anim_spd)) == 0 then
	 o.a_st += 1
	 if(o.a_st == nf) o.a_st = 0
	elseif o.a_la != sf then
	o.a_st = 0
	end

	o.a_fr = sf + o.a_st
	spr(o.a_fr, o.x, o.y, fl)
	o.a_la = sf
end

function collide()
	f = f or 0
	local p_adj = 0
	local x1 = (_char.x+6)/_tile_size
	local y1 = (_char.y+10)/_tile_size
	local x2 = ((_char.x+_char.max_width)-6)/_tile_size
	local y2 = ((_char.y+_char.max_height))/_tile_size
	local ax1 = ((_char.x+6)-p_adj)/_tile_size
	local ax2 = (((_char.x+_char.max_width)-6)+p_adj)/_tile_size
	local ay1 = ((_char.y+10)-p_adj)/_tile_size
	local ay2 = (((_char.y+_char.max_height))+p_adj)/_tile_size
	_char.d_x1 = x1*_tile_size
	_char.d_y1 = y1*_tile_size
	_char.d_x2 = x2*_tile_size
	_char.d_y2 = y2*_tile_size
	c1 = fget2(mget(x1, y1), f)
	c2 = fget2(mget(x1, y2), f)
	c3 = fget2(mget(x2, y2), f)
	c4 = fget2(mget(x2, y1), f)
	c5 = fget2(mget(x1, y2-1), f)
	c6 = fget2(mget(x2, y2-1), f)
	down_right = fget2(mget(ax2, ay2), f)
	down_left = fget2(mget(ax1, ay2), f)
	up_left = fget2(mget(ax1, ay1), f)
	up_right = fget2(mget(ax2, ay1), f)
	if (c1 or c2 or c3 or c4 or c5 or c6) then
		local has_adj = false
		local adj_val = 0.6
		if down_right == false then
			if _char.i_dir == direction.down then
				_char.x+=adj_val
				has_adj = true
			elseif _char.i_dir == direction.right then
				_char.y+=adj_val
				has_adj = true
			end
		end
		if down_left == false and has_adj == false then
			if _char.i_dir == direction.down then
				_char.x-=adj_val
				has_adj = true
			elseif _char.i_dir == direction.left then
				_char.y+=adj_val
				has_adj = true
			end
		end
		if up_left == false and has_adj == false then
			if _char.i_dir == direction.up then
				_char.x-=adj_val
				has_adj = true
			elseif _char.i_dir == direction.left then
				_char.y-=adj_val
				has_adj = true
			end
		end
		if up_right == false and has_adj == false then
			if _char.i_dir == direction.up then
				_char.x+=adj_val
				has_adj = true
			elseif _char.i_dir == direction.right then
				_char.y-=adj_val
				has_adj = true
			end
		end
		return true
	end
	return false
end

function coalesce(a, b)
	if a == nil then
		return b
	else
		return a
	end
end

function util.bool_to_int(a)
	if a then
		return 1
	else
		return 0
	end
end

function time_since(from, to, f)
	if f == true then
		return flr(to) - flr(from)
	else
		return to - from
	end
end

--tile sprite number, flag
function fget2(n, f)
	if f then
		return (fget(n)>>f)&1==1
	else
		return fget(n)
	end
end

-- pre calculated flag, flag
function fget_precalc(pcf, f)
	return (pcf>>f)&1==1
end

function table_length(t)
	local length = 0
	for i, c in pairs(t) do
		length+=1
	end
	return length
end

function util.name_contains(list, value)
	local return_value = false
	local return_object = nil
	for i, e in ipairs(list) do
		if e.name == value then
			return_value = true
			return_object = e
		end
	end
	return { check = return_value, val = return_object }
end

function draw_border()
	rect(_c_x-479, _c_y, _c_x-1, _c_y+269, 17)
	rect(_c_x-478, _c_y+1, _c_x-2, _c_y+268, 0)
	rect(_c_x-477, _c_y+2, _c_x-3, _c_y+267, 33)
end

function draw_info_text(t, d)
	local func = cocreate(function()
		local l = #t
		local n_px = l*5
		local x_offset = (480-n_px)/2
		for i=1,(d*60) do
			local x = (_c_x-480)+x_offset
			rectfill(x-1, _c_y+239, x+n_px+1, _c_y+248, 0)
			print(t, x, _c_y+240, 33)
			yield()
		end
	end)
	add(_coroutines, func)
end

gfx_offset={
	gfx_1=256,
	gfx_2=512,
	gfx_3=768
}
