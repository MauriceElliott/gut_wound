--[[pod_format="raw",created="2024-10-04 13:59:02",modified="2025-04-04 20:05:33",revision=1998]]

-- Title Scene
menu_buttons = { }
add(menu_buttons, {
	name = "start",
	sprite = gfx_offset.gfx_3+56,
	hovered_sprite = gfx_offset.gfx_3+57,
	x1 = -380,
	x2 = -316,
	y1 = 160,
	y2 = 192,
	dx = 100,
	dy = 160
})

function title_scene_draw()
	cls(16)
	
	spr(gfx_offset.gfx_3+49, 260, 20)
	spr(gfx_offset.gfx_3+48, 15, 20)
	for i, b in pairs(menu_buttons) do
		if _m_x > b.x1
		and _m_x < b.x2
		and _m_y > b.y1
		and _m_y < b.y2 then
			spr(b.hovered_sprite, b.dx, b.dy)
			if _m_l_b then
				if b.name == "start" then
					_game_start = true
				end
			end
		else
			spr(b.sprite, b.dx, b.dy)
		end
	end
end

function title_scene_update()
	
end

-- Game Scene
function game_scene_draw()
   update_camera()
	cls(0)
	map()
	update_interactables(_char)
	draw_blood_splatter()
	animate_character(_char)
	redraw_tiles(_char)
	draw_fires()
	draw_fow()
	display_moodles(c)
	update_inventory()
	draw_context_menu()
	draw_border()
end

function game_scene_update()
   move_man()
	scan_character_area()
	update_fires()
	lit_fire_scan()
	execute_context_menu_option()
	update_character_vitals()
	update_equippables()
	update_warmed_up_buff()
	_fire_in_range = nil
end
