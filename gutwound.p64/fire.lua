--[[pod_format="raw",created="2025-03-13 23:24:59",modified="2025-03-17 22:28:40",revision=361]]
include './types.lua'
include './util.lua'

-- smoke movement speed
_sms = 0.1

smoke=entity:new({
	x = 0,
	y = 0,
	s = 0,
	sdx = 0.1
})

--Max smoke objects
_mso = 3

-- Min and Max size of smoke
_smin = 1
_smax = 4

-- Smoke allowed offset (how far can it go side to size while rizing
_sao = 3

-- Smoke max height
_smh = 7


fire=entity:new({
	is_lit = true,
	replacement_sprite = 204,
	time_remaining = 0,
	--smoke origin x and y
	sox = 0,
	soy = 0,
	smoke = {},
	add_smoke = function(self)
		local smoke_size = _smin + rnd(_smax)
		ef = self
		local smoke_x = (ef.sox + (-4 + rnd(8))) 
		local new_smoke = smoke:new({
			x = smoke_x,
			y = ef.soy,
			s = smoke_size,
			sdx = _sms
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
				circfill(s.x, s.y, s.s, 17)
			end
		end
	end
end

function update_fires()
		for i, f in pairs(_fires) do
		if f.is_lit then
			if #f.smoke < _mso and time_since(f.smoke_update_timer, time(), false) >= 0.1 then
				f.add_smoke(f)
			end
			for i, s in pairs(f.smoke) do
				if s.y < (f.soy - _smh) then
					if s.s > 0 then
						s.s -= 1
						f.smoke_delete_timer = time()
					elseif time_since(f.smoke_delete_timer, time(), false) >= 0.1 then
						del(f.smoke, s)
						f.smoke_delete_timer = time()
					end
				end
				if s.x > (f.sox + _sao) then
					s.sdx += -_sms
				end
				if s.x < (f.sox - _sao) then
					s.sdx += _sms
				end
				s.x += s.sdx
				s.y += -_sms
			end
		end
	end
end

function fire_in_range(key)
	_fires[key].in_range = true
end

function light_fire(tile_x, tile_y)
	local k = tile_x .. "_" .. tile_y
	local fire = fire:new()
	fire.sox = tile_x * 16
	fire.soy = tile_y * 16
	mset(tile_x, tile_y, 204)
	mset(tile_x, tile_y+1, 212)
	_fires[k] = fire
end

function add_fuel()

end