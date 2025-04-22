--[[pod_format="raw",created="2024-07-07 21:47:51",modified="2025-04-22 21:20:57",revision=4783]]
_ts = 16

fog_patch=entity:new({
		s_x = 0,
		s_y = 0,
		e_x = 0,
		e_y = 0,
		-- offset values
		s_xo = 0,
		s_yo = 0,
		e_xo = 0,
		e_yo = 0,
})

room=entity:new({
	fog_patches = {},
	is_discovered = false,
	-- door replacement sprites
	replacement_sprite = 0,
	call_unlock = nil,
})

function update_fog_patches(fog_patches)
		for i, fp in pairs(fog_patches) do
			fp.s_x = (fp.s_x * _ts) + fp.s_xo
			fp.s_y = (fp.s_y * _ts) + fp.s_yo
			fp.e_x = (fp.e_x * _ts) + fp.e_xo
			fp.e_y = (fp.e_y * _ts) + fp.e_yo
		end
		return fog_patches
end

function draw_fow()
	for i, r in pairs(_rooms) do
		if r.is_discovered == false then
			for i, fp in pairs(r.fog_patches) do 
				if _c_x > fp.s_x and _c_y_b > fp.s_y then
					rectfill(fp.s_x, fp.s_y, fp.e_x, fp.e_y, 0)
					if _c_x > fp.e_x and _c_y_b < fp.e_y then
						rectfill(fp.s_x, fp.s_y, fp.e_x, fp.e_y, 0)
					elseif _c_x < fp.e_x and _c_y_b > fp.e_y then
						rectfill(r.s_x, r.s_y, _c_x, r.e_y, 0)
					end
				end
			end
		end
	end
end

function unlock_inner_door(ft,rep_tile)
	mset(ft.tile_co.x, ft.tile_co.y, rep_tile)
	mset(ft.tile_co.x, ft.tile_co.y+1, rep_tile)
end

function unlock_normal_door(room, ft)
	mset(ft.tile_co.x, ft.tile_co.y, room.replacement_sprite)
	mset(ft.tile_co.x, ft.tile_co.y+1, room.replacement_sprite)
	room.is_discovered=true
end

function unlock_heavy_door(room, ft)
	if room.call_counter == nil then
		room.call_counter = 0
	end
   if room.call_counter == 0 then
       room.call_counter += 1
       draw_info_text("The door is jammed, try again and put some weight into it.", 5)
   else
       _char.health -= 10
       _char.wound_health -= 20
       mset(ft.tile_co.x, ft.tile_co.y, room.replacement_sprite)
       mset(ft.tile_co.x, ft.tile_co.y+1, room.replacement_sprite)
       room.is_discovered=true
   end
end

function unlock_locked_door(room, ft)
	_dbm = "unlock locked door"
	draw_info_text("This door is locked", 5)
end