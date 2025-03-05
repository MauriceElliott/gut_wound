--[[pod_format="raw",created="2024-10-04 13:59:02",modified="2025-03-05 23:44:11",revision=598]]
include './character.lua'

-- Title Scene
function title_scene_draw()
	cls(16)
	
	spr(gfx_offset.gfx_3+49, 250, 20)
	spr(gfx_offset.gfx_3+48, 15, 20)
	spr(gfx_offset.gfx_3+56, 100, 135)
	if _m_x > 100 
	and _m_x < 120
	and _m_y > 135
	and _m_y < 155
	and _m_l_b then
		_game_start = true
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
	draw_fow()
	display_moodles(c)
	update_inventory()
	draw_context_menu()
	draw_border()
end

function game_scene_update()
    move_man()
	scan_character_area()
	execute_context_menu_option()
	update_character_vitals()
	update_equippables()
end
