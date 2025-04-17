--[[pod_format="raw",created="2025-03-13 23:24:59",modified="2025-04-17 22:13:35",revision=2249]]


-- smoke movement speed
_sms = 0.08
--Max smoke objects
_mso = 7
-- Min and Max size of smoke
_smin = 1
_smax = 3
-- Smoke allowed offset (how far can it go side to size while rizing
_sao = 3
-- Smoke max height
_smh = 7
-- Smoke colour index
_sc = { 17, 14, 31 }
_sci = 0
-- Smoke size reduction as its fading out 
_ssr = 0.04
-- Smoke update timer, how often are new smoke objects added to the collection
_sut = 0.2
-- Starting position offset
_spo = 4

-- Fire
-- Default time to live
_dttl = 30

smoke=entity:new({
	x = 0,
	y = 0,
	s = 0,
	c = 17,
	sdx = 0.1
})

fire=entity:new({
	is_lit = true,
	time_remaining = 0,
	key = "",
	x = 0,
	y = 0,
	--smoke origin x and y
	sox = 0,
	soy = 0,
	smoke = {},
	add_smoke = function(self)
		local smoke_size = _smin + rnd(_smax)
		if _sci > 2 then
			_sci = 0
		else
			_sci+=1
		end
		local smoke_colour = _sc[_sci]
		ef = self
		local smoke_x = (ef.sox + (-_spo + rnd(_spo)))
		local smoke_y = (ef.soy + (rnd(_spo)))
		local new_smoke = smoke:new({
			x = smoke_x,
			y = smoke_y,
			s = smoke_size,
			c = smoke_colour,
			sdx = ((-_sms*2) + rnd(_sms))
		})
		add(self.smoke, new_smoke)
		smoke_update_timer = time()
	end,
	new = function(self)
		self.smoke_update_timer = time()
		self.smoke_delete_timer = time()
		self.start_timer = time()
		return self
	end,
	time_to_live = _dttl,
})

function draw_fires()
	for i, f in pairs(_fires) do
		if f.is_lit then
			for i, s in pairs(f.smoke) do
				circfill(s.x, s.y, s.s, s.c)
			end
		end
	end
end

function update_fires()
	for i, f in pairs(_fires) do
		local f_time_remaining = f.time_to_live - time_since(f.start_timer, time(), false)
		if f_time_remaining < 0 then
			putout_fire(f)
		else
			f.time_remaining = f_time_remaining
		end
		if f.is_lit then
			if #f.smoke < _mso and time_since(f.smoke_update_timer, time(), false) >= _sut then
				f.add_smoke(f)
				f.smoke_update_timer = time()
			end
			for i, s in pairs(f.smoke) do
				if s.y < (f.soy - _smh) then
					if s.s > 0 then
						s.s -= _ssr
					else
						del(f.smoke, s)
					end
				end
				if s.x > (f.sox + _sao) then
					s.sdx = -s.sdx
				end
				if s.x < (f.sox - _sao) then
					s.sdx = abs(s.sdx)
				end
				s.x += s.sdx
				s.y += -_sms
			end
		end
	end
end

function lit_fire_scan()
	_in_range_lit_fire = nil
	if _fire_in_range != nil then
		for i, f in pairs(_fires) do
			if f.x == _fire_in_range.x and f.y == _fire_in_range.y and f.is_lit == true then
				_in_range_lit_fire = { fire = f }
			end
		end
	end
end

function ctx_menu_fire_check(item)
	lit_fire_scan()
	if _in_range_lit_fire != nil then
		_fire_item = item
		return true
	end
	return false
end

function add_fuel()
	local irlf = _in_range_lit_fire
	local fk = irlf.fire.key
	_fires[fk].time_to_live += _fire_item.fuel_value
	for i=0,5 do
		local smoke_x = (ef.sox + (-_spo + rnd(_spo)))
		local smoke_y = (ef.soy + (rnd(_spo)))
		local new_smoke = smoke:new({
			x = smoke_x,
			y = smoke_y,
			s = 1,
			c = 28,
			sdx = ((-_sms*2) + rnd(_sms))
			
		})
		add(_fires[fk].smoke, new_smoke)
	end
	remove_item_from_container(_inv, _fire_item)
	_fire_item = nil
end

function heat_on_fire()
	local irlf = _in_range_lit_fire
	if _in_range_lit_fire != nil then
		_fire_item.is_hot = true
	end
	add_to_inventory(_inv, _fire_item)
	_fire_item = nil
end

-- Time til warmed up buff
_ttwub = 15
-- Warmed up buff, used as multiplier
_wub = 1
-- Warmed up buff removed and applied
_wubr = 1
_wuba = 4
-- time til warmed up buff is removed
_warmed_up_buff_applied_start = nil
-- time buff stays on when moving away from fire
_warmed_up_buff_timeout = 75
-- Timer used to check if the player 
-- has been standing by the fire long enough to get the buff
_warm_up_buff_timer = nil

function update_warmed_up_buff()
	if _in_range_lit_fire == nil then
		_warm_up_buff_timer = nil
		if _warmed_up_buff_applied_start != nil then
			if time_since(_warmed_up_buff_applied_start, time(), false) > _warmed_up_buff_timeout then
				_warmed_up_buff_applied_start = nil
				_wub = _wubr
			end
		end
	elseif _warm_up_buff_timer == nil then
		_warm_up_buff_timer = time()
	end
	if _warm_up_buff_timer != nil then
		if time_since(_warm_up_buff_timer, time(), false) > _ttwub then
			_wub = _wuba
			_warmed_up_buff_applied_start = time()
		end
	end
end

function light_fire()
	local tile_x, tile_y = _fire_in_range.x, _fire_in_range.y
	local k = tile_x .. "_" .. tile_y
	local fire = fire:new({})
	fire.x = tile_x
	fire.y = tile_y
	fire.key = k
	fire.sox = (tile_x * _tile_size)+ 6
	fire.soy = (tile_y * _tile_size)+ 3
	mset(tile_x, tile_y, fire_tiles.lit.top)
	mset(tile_x, tile_y+1, fire_tiles.lit.bottom)
	_fires[k] = fire
end

function putout_fire(fire)
	local key = fire.x .. "_" .. fire.y
	del(_fires, fire)
	_fires[key] = nil
	mset(fire.x, fire.y, fire_tiles.unlit.top)
	mset(fire.x, fire.y+1, fire_tiles.unlit.bottom)
end

fire_tiles = {
	lit = {
		top = 204,
		bottom = 212,
	},
	unlit = {
		top = 163,
		bottom = 171
	}
}