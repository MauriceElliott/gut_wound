--[[pod_format="raw",created="2025-03-13 23:24:59",modified="2025-03-13 23:58:21",revision=28]]
include './types.lua'
include './util.lua'

smoke=entity:new({
	x,
	y,
	s,
})

fire=entity:new({
	is_lit = false,
	replacement_sprite = 204,
	time_remaining = 0,
	--smoke origin x and y
	sox = 0,
	soy = 0,
	smoke = {},
	fuel = {}
})

_fires["27_5"] = fire:new({
	sox = 436, 
	soy = 86,
})


function draw_fires()
	for i, f in pairs(_fires) do
		if f.is_lit then
			for i, s in pairs(f.smoke) do
				circfill(s.x, s.y, s.s)
			end
		end
	end
end

function update_fires()
	
end

function fire_in_range(key)
	_fires[key].in_range = true
end

function light_fire(tile_x, tile_y)
	add(_fires, fire:new())
end

function add_fuel()

end