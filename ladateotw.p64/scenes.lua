--[[pod_format="raw",created="2024-10-04 13:59:02",modified="2024-10-04 14:13:41",revision=28]]
-- Title Scene
function title_scene_draw()
	cls(16)
	spr(gfx_offset.gfx_3+49, 250, 20)
	spr(gfx_offset.gfx_3+48, 15, 20)
end

function title_scene_update()

end

-- Game Scene
function game_scene_draw()
    update_camera()
	cls(0)
	map()
	draw_fow()
	display_moodles(c)
	update_interactables(_char)
	draw_blood_splatter()
	animate_character(_char)
	redraw_tiles(_char)
	update_inventory()
	draw_context_menu()
	draw_border()
end

function game_scene_update()
    move_man()
	scan_character_area()
	execute_context_menu_option()
	update_character_vitals()
end
