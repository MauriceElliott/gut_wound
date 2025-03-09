--[[pod_format="raw",created="2025-03-05 22:54:36",modified="2025-03-09 22:56:59",revision=113]]
fire=entity:new({
	x = 0,
	y = 0,
	lit = false,
})

function make_fire()
	if collide() == false then
		local fire = fire:new({x = _char.x, y = _char.y})
		add(_fires, fire)
	end
end

function draw_fire()
	for i, f in pairs(_fires) do
		spr(204, f.x, f.y)
	end
end