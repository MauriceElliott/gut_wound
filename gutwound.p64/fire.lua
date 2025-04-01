--[[pod_format="raw",created="2025-03-13 23:24:59",modified="2025-04-01 20:44:07",revision=1047]]


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
	x = 0,
	y = 0,
	--smoke origin x and y
	sox = 0,
	soy = 0,
	smoke = {},
	add_smoke = function(self)
		local smoke_size = _smin + rnd(_smax)
		if _sci > 1 then
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
	smoke_update_timer = time(),
	smoke_delete_timer = time(),
	start_timer = time(),
	time_to_live = 30,
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
		if time_since(f.start_timer, time(), false) >= f.time_to_live then
			f.is_lit = false
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

function ctx_menu_fuel_add(item)
	_in_range_lit_fire = nil
	for i, f in pairs(_fires) do
		if f.x == _fire_in_range.x and f.y == _fire_in_range.y then
			_in_range_lit_fire = { in_range = true, fire = f, item = item }
			return true
		end
	end
end

function add_fuel()
	local irlf = _in_range_lit_fire
	del(_fires, _in_range_lit_fire)
	irlf.fire.time_to_live += irlf.item.fuel_value
	add(_fires, irlf)
end

function light_fire()
	local tile_x, tile_y = _fire_in_range.x, _fire_in_range.y
	local k = tile_x .. "_" .. tile_y
	local fire = fire:new()
	fire.x = tile_x
	fire.y = tile_y
	fire.sox = (tile_x * 16)+ 6
	fire.soy = (tile_y * 16)+ 3
	mset(tile_x, tile_y, 204)
	mset(tile_x, tile_y+1, 212)
	_fires[k] = fire
end