--[[pod_format="raw",created="2024-07-07 21:47:51",modified="2025-04-14 21:21:06",revision=4405]]
_ts = 16

room=entity:new({
	s_x = 0,
	s_y = 0,
	e_x = 0,
	e_y = 0,
	-- ofset values
	s_xo = 0,
	s_yo = 0,
	e_xo = 0,
	e_yo = 0,
	is_discovered = false,
	-- door replacement sprites
	replacement_sprite = 0,
	call_unlock = nil,
	new = function(self, sx, sy, ex, ey, sxo, syo, exo, eyo, rs, unlock_function)
		self.s_x = (sx * _ts) + sxo
		self.s_y = (sy * _ts) + syo
		self.e_x = (ex * _ts) + exo
		self.e_y = (ey * _ts) + eyo
		self.replacement_sprite = rs
		self.call_unlock = unlock_function
		return self
	end
})

function draw_fow()
	for i, r in pairs(_rooms) do
		_dbm = "_rooms count: " .. table_length(_rooms)
		if r.is_discovered == false then
			if _c_x > r.s_x and _c_y_b > r.s_y then
				rectfill(r.s_x, r.s_y, r.e_x, r.e_y, 0)
				if _c_x > r.e_x and _c_y_b < r.e_y then
					_dbm = "if: " .. i
					rectfill(r.s_x, r.s_y, r.e_x, r.e_y, 0)
				elseif _c_x < r.e_x and _c_y_b > r.e_y then
					_dbm = "else: " .. i
					rectfill(r.s_x, r.s_y, _c_x, r.e_y, 0)
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