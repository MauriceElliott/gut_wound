--[[pod_format="raw",created="2024-07-07 21:47:51",modified="2024-10-18 20:36:32",revision=2316]]
include './types.lua'
include './util.lua'

room=entity:new({
	s_x = 0,
	s_y = 0,
	e_x = 0,
	e_y = 0,
	is_discovered = false,
	replacement_sprite = 0,
	is_unlocked = true,
	call_counter = 0
})

function draw_fow()
	for i, r in pairs(_rooms) do
		if r.is_discovered == false then
			if _c_x > r.s_x and _c_y_b > r.s_y then
				rectfill(r.s_x, r.s_y, r.e_x, r.e_y, 0)
				if _c_x > r.e_x and _c_y_b < r.e_y then
					rectfill(r.s_x, r.s_y, r.e_x, _c_y_b, 0)
				elseif _c_x < r.e_x and _c_y_b > r.e_y then
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
    if room.call_counter == 0 then
        room.call_counter += 1
        draw_info_text("The door is jammed, try again and put some weight into it.", 5)
    else
        c.health -= 10
        c.wound_health -= 20
        mset(ft.tile_co.x, ft.tile_co.y, room.replacement_sprite)
        mset(ft.tile_co.x, ft.tile_co.y+1, room.replacement_sprite)
        room.is_discovered=true
    end
end

function init_rooms()
	_rooms["19_10"] = room:new({
		s_x = 272,
		s_y = 0,
		e_x = 448+15,
		e_y = 144+15,
		replacement_sprite = 11,
		is_discovered = false,
		call_unlock = unlock_normal_door
	})
	_rooms["37_10"] = room:new({
		s_x = 464,
		s_y = 0,
		e_x = 688+15,
		e_y = 144+15,
		replacement_sprite = 11,
		is_discovered = false,
		call_unlock = unlock_heavy_door,
		call_counter = 0
	})
end
