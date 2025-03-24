--[[pod_format="raw",created="2025-03-13 23:24:59",modified="2025-03-24 22:42:38",revision=814]]


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
	fuel = {},
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

function light_fire()
	local tile_x, tile_y = _fire_in_range.x, _fire_in_range.y
	local k = tile_x .. "_" .. tile_y
	local fire = fire:new()
	fire.sox = (tile_x * 16)+ 6
	fire.soy = (tile_y * 16)+ 3
	mset(tile_x, tile_y, 204)
	mset(tile_x, tile_y+1, 212)
	_fires[k] = fire
end