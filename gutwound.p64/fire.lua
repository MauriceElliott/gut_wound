--[[pod_format="raw",created="2025-03-13 23:24:59",modified="2025-03-13 23:43:57",revision=7]]
include './types.lua'
include './util.lua'

smoke=entity:new({
	x,
	y,
	s,
})

fire=entity:new({
	tile_x = 0,
	tile_y = 0,
	x = 0,
	y = 0,
	is_lit = false,
	replacement_sprite = 204,
	time_remaining = 0,
	smoke_origin_point = 0,
	smoke = {},
	fuel = {}
})

_fires = {

}

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

function light_fire(tile_x, tile_y)
	add(_fires, fire:new())
end

function add_fuel()

end