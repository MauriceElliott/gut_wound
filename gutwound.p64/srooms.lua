--[[pod_format="raw",created="2025-05-05 21:14:37",modified="2025-05-23 18:00:06",revision=92]]
--[[
Rooms
]]

function init_rooms()
	_rooms["19_10"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 17, 
				s_y = 4, 
				e_x = 28, 
				e_y = 9, 
				s_xo = 0, 
				s_yo = 0, 
				e_xo = 15, 
				e_yo = 15, 
			})
		}),
		replacement_sprite = 11, 
		call_unlock = unlock_normal_door
	})

	_rooms["18_4"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 17, 
				s_y = 0, 
				e_x = 28, 
				e_y = 4, 
				s_xo = 0, 
				s_yo = 0, 
				e_xo = 15, 
				e_yo = 0, 
			})
		}),
		replacement_sprite = 11, 
		call_unlock = unlock_normal_door
	})

	_rooms["4_14"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 1,
				s_y = 15,
				e_x = 6,
				e_y = 19,
				s_xo = 0, 
				s_yo = -14,
				e_xo = 25,
				e_yo = 17,
			})
		}),
		replacement_sprite = 9, 
		call_unlock = unlock_normal_door
	})

	_rooms["3_34"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 1, 
				s_y = 30, 
				e_x = 6, 
				e_y = 33,
				s_xo = 0, 
				s_yo = -13, 
				e_xo = 15,
				e_yo = 15,
			})
		}),
		replacement_sprite = 9, 
		call_unlock = unlock_normal_door
	})
	
	_rooms["3_39"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 1, 
				s_y = 34, 
				e_x = 44, 
				e_y = 39,
				s_xo = 0, 
				s_yo = -28, 
				e_xo = 15,
				e_yo = 15,
			})
		}),
		replacement_sprite = 128, 
		call_unlock = unlock_normal_door
	})
	
	_rooms["6_20"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 1,
				s_y = 20,
				e_x = 6,
				e_y = 24,
				s_xo = 0,
				s_yo = 2,
				e_xo = 15,
				e_yo = 18,
			})
		}),
		replacement_sprite = 128, 
		call_unlock = unlock_normal_door
	})
	
	_rooms["2_25"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 1,
				s_y = 25,
				e_x = 6,
				e_y = 28,
				s_xo = 0,
				s_yo = 2,
				e_xo = 15,
				e_yo = 18,
			})
		}),
		replacement_sprite = 11, 
		call_unlock = unlock_normal_door
	})

	_rooms["13_14"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 10, 
				s_y = 14, 
				e_x = 25, 
				e_y = 25,
				s_xo = -25, 
				s_yo = 2, 
				e_xo = 40,
				e_yo = 25,
			}),
			fog_patch:new({
				s_x = 26,
				s_y = 18,
				e_x = 32,
				e_y = 20,
				s_xo = 0, 
				s_yo = 2,
				e_xo = 15,
				e_yo = 14,
			})
		}),
		replacement_sprite = 9, 
		call_unlock = unlock_normal_door
	})
	
	_rooms["10_26"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 10, 
				s_y = 26, 
				e_x = 25, 
				e_y = 31,
				s_xo = -20, 
				s_yo = 2, 
				e_xo = 15,
				e_yo = 25,
			})
		}),
		replacement_sprite = 4, 
		call_unlock = unlock_normal_door
	})
	
	
	_rooms["40_12"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 40,
				s_y = 10,
				e_x = 54,
				e_y = 31,
				s_xo = 11,
				s_yo = 6,
				e_xo = 15,
				e_yo = 18,
			}),
			fog_patch:new({
				s_x = 44,
				s_y = 0,
				e_x = 56,
				e_y = 10,
				s_xo = -8,
				s_yo = 8,
				e_xo = 15,
				e_yo = 18,
			}),
			fog_patch:new({
				s_x = 26,
				s_y = 21,
				e_x = 33,
				e_y = 45,
				s_xo = 6,
				s_yo = 3,
				e_xo = -1,
				e_yo = 0,
			}),
			fog_patch:new({
				s_x = 32,
				s_y = 25,
				e_x = 50,
				e_y = 34,
				s_xo = 6,
				s_yo = 3,
				e_xo = -1,
				e_yo = 0,
			})
		}),
		replacement_sprite = 1, 
		call_unlock = unlock_locked_door
	})
	
	_rooms["37_10"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 30,
				s_y = 4,
				e_x = 42,
				e_y = 9,
				s_xo = -10,
				s_yo = 0,
				e_xo = 25,
				e_yo = 15,
			})
		}),
		replacement_sprite = 11,
		call_unlock = unlock_normal_door
	})

	_rooms["38_4"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 30,
				s_y = 0,
				e_x = 42,
				e_y = 3,
				s_xo = -10,
				s_yo = 4,
				e_xo = 25,
				e_yo = 15,
			})
		}),
		replacement_sprite = 128, 
		call_unlock = unlock_normal_door
	})
	
	_rooms["36_18"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 34,
				s_y = 18,
				e_x = 38,
				e_y = 24,
				s_xo = 0,
				s_yo = 2,
				e_xo = 15,
				e_yo = 15,
			})
		}),
		replacement_sprite = 13, 
		call_unlock = unlock_normal_door
	})
end
