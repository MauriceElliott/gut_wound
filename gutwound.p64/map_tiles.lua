--[[pod_format="raw",created="2024-05-23 20:57:56",modified="2025-04-03 09:37:11",revision=7762]]

function update_interactables(c)
	local is_cont_in_range = false
	for i,ft in pairs(_flagged_tiles) do
		if fget_precalc(ft.flags,1) == true then
			local container_co = tostr(ft.tile_co.x) .. "_" .. tostr(ft.tile_co.y)
			local container_obj = _containers[container_co]
			if container_obj != nil then
				is_cont_in_range = true
				container_obj.in_range = true
				if _inv.selected_container == 1 or _inv.selected_container == container_co then
					spr(
						container_obj.in_range_sprite,
						(flr(ft.tile_co.x*_tile_size)) + container_obj.in_range_sprite_adjustment.x,
						(flr(ft.tile_co.y*_tile_size)) + container_obj.in_range_sprite_adjustment.y
					)
				end
				if _discovered_containers[container_co] == nil then
					_discovered_containers[container_co] = container_obj
				else
					_discovered_containers[container_co].in_range = true
				end
			end
		end
		if fget_precalc(ft.flags,2) == true then
			if keyp("e") then
				local room_key = ft.tile_co.x .. "_" .. ft.tile_co.y
				local room = _rooms[room_key]
				if room != nil then
					room.call_unlock(room, ft)
				else
					replacement_tile = mget(ft.tile_co.x, ft.tile_co.y-1)
					unlock_inner_door(ft, replacement_tile)
				end
			end
		end
		if fget_precalc(ft.flags,3) == true then
			if (coalesce(_char.d_y2, 0)-16) < (ft.tile_co.y*16) then
				add(_redraw_list, ft)
			end
		end
		if fget_precalc(ft.flags,5) == true then
			_fire_in_range = { x = ft.tile_co.x, y = ft.tile_co.y }
		end
	end
	if not is_cont_in_range then
		for i, dc in pairs(_discovered_containers) do
			dc.in_range = false
		end
	end
	_flagged_tiles = {}
end

function redraw_tiles(c)
	for i, ft in ipairs(_redraw_list) do
		palt(48, true)
		spr(ft.sprite, ft.tile_co.x*16, ft.tile_co.y*16)
		palt()
		poke4(0x5000, get(fetch(pwd().."/pal/0.pal")))
	end
	_redraw_list={}
end
