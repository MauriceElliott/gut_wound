--[[pod_format="raw",created="2025-03-23 23:23:11",modified="2025-05-05 15:18:45",revision=2651]]
include './fire.lua'

--[[
Rooms
Controls fog of war
Can be a bit less rigid.
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
				e_xo = 15,
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
				s_xo = 0, 
				s_yo = 2, 
				e_xo = 15,
				e_yo = 15,
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
				s_xo = 0, 
				s_yo = 2, 
				e_xo = 15,
				e_yo = 15,
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
				e_y = 31,
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

--	-- Main door to rest of building
--	_rooms["6_20"] = room:new(
--	{
--		fog_patches = update_fog_patches({
--			fog_patch:new({
--				s_x = 1,
--				s_y = 20,
--				e_x = 6,
--				e_y = 24,
--				s_xo = 0,
--				s_yo = 2,
--				e_xo = 15,
--				e_yo = 18,
--			})
--		}),
--		replacement_sprite = 128, 
--		call_unlock = unlock_normal_door
--	})
	
	_rooms["37_10"] = room:new(
	{
		fog_patches = update_fog_patches({
			fog_patch:new({
				s_x = 30,
				s_y = 4,
				e_x = 42,
				e_y = 9,
				s_xo = 0,
				s_yo = 0,
				e_xo = 15,
				e_yo = 15,
			})
		}),
		replacement_sprite = 128, 
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
				s_xo = 0,
				s_yo = 4,
				e_xo = 15,
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

--[[
Items
Section to define new inventory items
gfx 3
]]

item=entity:new({
	type = object_type.item,
	sprite = 0,
	name = "",
	weight = 1.0,
	is_flamable = false,
	fuel_value = 10,
	item_type = nil,
	description = "",
})

item_type = {
	consumable = 1,
	junk = 2,
	useable = 3,
	equipable = 4,
	unique = 5,
	readable = 6,
}

-----------------
-- CONSUMABLES --
-----------------


consumable=item:new({
	item_type = item_type.consumable,
	is_hot = false,
	thirst = 0,
	hunger = 0,
	delirium = 0,
	fatigue = 0,
	wound_health = 0,
	health = 0,
	pain = 0,
	can_heat = false,
	hot_offset = 0,
	cold_offset = 0,
	consume = function(self)
		local offset = 0
		if is_hot then
			offset = self.hot_offset
		else
			offset = self.cold_offset
		end
		_char.thirst -= (self.thirst + offset)
		_char.hunger -= (self.hunger + offset)
		_char.delirium -= (self.delirium + offset)
		_char.pain -= self.pain
		_char.fatigue -= self.fatigue
		_char.wound_health += self.wound_health
		_char.health += self.health
		remove_item_from_container(_inv, self)
		_char.thirst = max(_char.thirst, 0)
		_char.hunger = max(_char.hunger, 0)
		_char.pain = max(_char.pain, 0)
		_char.fatigue = max(_char.fatigue, 0)
		_char.wound_health = min(_char.wound_health, 100)
		_char.health = min(_char.health, 100)
	end,
	heat = function(self)
		self.is_hot = true
	end
})

water_bottle=consumable:new({
	sprite = (gfx_offset.gfx_3+130),
	name = "Water Bottle",
	weight = 0.8,
	thirst = 20,
})

fizzy_drink_can=consumable:new({
	sprite = (gfx_offset.gfx_3+128),
	name = "Fizzy Drink",
	weight = 0.6,
	thirst = 15,
	hunger = 3,
	delirium = 1,
	fatigue = 10,
})

energy_drink=consumable:new({
	sprite = (gfx_offset.gfx_3+129),
	name = "Energy Drink",
	weight = 0.5,
	thirst = 10,
	delirium = 5,
	fatigue = 25,
})

antiseptic=consumable:new({
	sprite = (gfx_offset.gfx_3+136),
	name = "Antiseptic",
	weight = 0.4,
	wound_health = 20,
})

suture_needle=consumable:new({
	sprite = (gfx_offset.gfx_3+137),
	name = "Suture Needle",
	weight = 0.1,
	wound_health = 25,
})

painkillers=consumable:new({
	sprite = (gfx_offset.gfx_3+138),
	name = "Painkillers",
	weight = 0.05,
	pain = 10,
})

canned_clams=consumable:new({
	sprite = (gfx_offset.gfx_3+131),
	name = "Clams",
	delirium = 2,
	hunger = 9,
	hot_offset = 5,
	cold_offset = -5,
	weight = 0.4,
})

canned_mushrooms=consumable:new({
	sprite = (gfx_offset.gfx_3+132),
	name = "Mushrooms",
	weight = 0.4,
	hunger = 10,
	can_heat = true,
	hot_offset = 5,
	cold_offset = -5,
})

jarred_kimchi=consumable:new({
	sprite = (gfx_offset.gfx_3+133),
	name = "Kimchi",
	weight = 0.35,
	hunger = 8,
	hot_offset = 4,
	thirst = 4,
	delirium = -2,
})

canned_minced_prawn=consumable:new({
	sprite = (gfx_offset.gfx_3+134),
	name = "Minced Prawn",
	weight = 0.4,
	can_heat = true,
	hunger = 10,
	hot_offset = 10,
	cold_offset = -5,
})

jarred_veg=consumable:new({
	sprite = (gfx_offset.gfx_3+135),
	name = "Vegetables",
	weight = 0.4,
	hunger = 12,
	thirst = 5,
	delirium = -8,
})

canned_sardines=consumable:new({
	sprite = (gfx_offset.gfx_3+139),
	name = "Sardines",
	weight = 0.2,
	hunger = 10,
})

lunch_meat=consumable:new({
	sprite = (gfx_offset.gfx_3+140),
	name = "Lunch Meat",
	weight = 0.35,
	can_heat = true,
	hunger = 18,
	hot_offset = 2,
})

canned_beans=consumable:new({
	sprite = (gfx_offset.gfx_3+141),
	name = "Beans",
	weight = 0.4,
	can_heat = true,
	hunger = 12,
	cold_offset = -4,
})

canned_tofu=consumable:new({
	sprite = (gfx_offset.gfx_3+142),
	name = "Tofu",
	weight = 0.4,
	can_heat = true,
	hot_offset = 5,
	cold_offset = -4,
	hunger = 10,
	delirium = -4,
})

cloth_strips=consumable:new({
	sprite = (gfx_offset.gfx_3+153),
	name = "Tofu",
	weight = 0.4,
	wound_health = 10,
	health = 10,
})

iced_tea=consumable:new({
	sprite = (gfx_offset.gfx_3+156),
	name = "Iced Tea",
	weight = 0.4,
	thirst = 25,
	hunger = 5,
	fatigue = 15,
})

--------------
-- Readable --
--------------
readable = item:new({
	item_type = item_type.readable,
	open_sprite = 0,
	is_flamable = true,
	weight = 0.8,
	text = "",
	time_to_read = 10,
	read = function(self)
		draw_info_text(self.text, self.time_to_read)
	end,
})

letter = readable:new({
	sprite = (gfx_offset.gfx_3+144),
	name = "Letter",
	text = "To my darling wife\n" ..
			 "I hope it is not too late, the final days are uppon us\n" ..
			 "God willing I will make it back to before too long\n" ..
			 "Keep yourself safe, stock up as much as possible, and don't trust a soul\n" .. 
			 "I am leaving this hell hole a week from now when I can guarantee our safety,\n" .. 
			 "Don't worry about Ari, I promise he will be home safe before you know it\n" .. 
			 "Look after our daughter,\n" .. 
			 "I love you",
})

----------
-- Junk --
----------
junk=item:new({
	item_type = item_type.junk,
	fuel_value = 15,
})

cardboard=junk:new({
	sprite=(gfx_offset.gfx_3+143),
	name="Cardboard",
	is_flamable = true,
})

rancid_food=junk:new({
	sprite=(gfx_offset.gfx_3+151),
	name="Rancid Food",
})

glass=junk:new({
	sprite=(gfx_offset.gfx_3+146),
	name="Glass"
})

teapot=junk:new({
	sprite=(gfx_offset.gfx_3+147),
	name="Teapot"
})

bleach=junk:new({
	sprite=(gfx_offset.gfx_3+148),
	name="Bleach"
})

sponge=junk:new({
	sprite=(gfx_offset.gfx_3+149),
	name="Sponge"
})

binbag=junk:new({
	sprite=(gfx_offset.gfx_3+150),
	name="Binbag",
})

-------------
-- useable --
-------------
usable_subtype = {
	rippable = 1,
	firestarter = 2,
}

local rip_cloth=function(self)
	add(_inv.contents,
		container_slot:new({
			quantity = 2,
			item = cloth_strips:new({})
		})
	)
	del(_inv,self)
end

useable=item:new({
	item_type=item_type.useable,
})

wash_cloth=useable:new({
	subtype = usable_subtype.rippable,
	sprite=(gfx_offset.gfx_3+152),
	name="Wash Cloth",
	use=rip_cloth
})

rag=useable:new({
	subtype = usable_subtype.rippable,
	sprite=(gfx_offset.gfx_3+153),
	name="Rag",
	use=rip_cloth
})

lighter=useable:new({
	subtype = usable_subtype.firestarter,
	sprite = (gfx_offset.gfx_3+155),
	name = "Lighter",
	use = light_fire
})

journal=useable:new({
	sprite=(gfx_offset.gfx_3+145),
	name="Journal",
	use=use_journal,
})

---------------
-- equipable --
---------------
equipable=item:new({
	item_type = item_type.equipable,
})


backpack=equipable:new({
	sprite=(gfx_offset.gfx_3+154),
	name="Backpack",
	is_equipped=false,
	u_spr = { sprite = 220, x = 5, y = 8 },
	d_spr = { sprite = 221, x = 8, y = 8 },
	l_spr = { sprite = 223, x = 8, y = 8 },
	r_spr = { sprite = 222, x = -3, y = 9 },
	equip=function(self)
		add(_char.equipped_items, self)
		self.is_equipped=true
	end,
	unequip=function(self)
		del(_char.equpped_items, self)
		self.is_equipped=false
	end
})


--[[
Containers
]]


container=entity:new({
	small_icon = 0,
	in_range_sprite = 0,
	in_range = false,
	search_timer = nil,
	update_timer = nil,
	is_searched = false,
	contents = {},
})

function init_container_defaults(container)
	if container.sprite == 137 then
		container.small_icon = 141
		container.in_range_sprite = 130
		container.in_range_sprite_adjustment = { x = 0, y = -16 }
		container.contents = get_early_boxes()
	elseif container.sprite == 140 then
		container.small_icon = 141
		container.in_range_sprite = 133
		container.in_range_sprite_adjustment = { x = -2, y = -16 }
		container.in_range = false
		container.contents = get_start_letterbox()
	elseif container.sprite == 187 then
		container.small_icon = 210
		container.in_range_sprite = 138
		container.in_range_sprite_adjustment = { x = -1 ,y = -9 }
		container.contents = get_early_bookshelf()
	elseif container.sprite == 170 then
		container.small_icon = 211
		container.in_range_sprite = 208
		container.in_range_sprite_adjustment = { x= -1, y = -17 }
		container.contents = get_early_fridge()
	elseif container.sprite == 149 then
		container.small_icon = 184
		container.in_range_sprite = 176
		container.in_range_sprite_adjustment = { x = 0, y = -9 }
		container.contents = get_early_bedroom()
	elseif container.sprite == 160 then
		container.small_icon = 184
		container.in_range_sprite = 176
		container.in_range_sprite_adjustment = { x = 0, y = -9 }
		container.contents = get_early_kitchen()
	elseif container.sprite == 161 then
		container.small_icon = 219
		container.in_range_sprite = 176
		container.in_range_sprite_adjustment = { x = 0, y = -9 }
		container.contents = get_early_kitchen()
	elseif container.sprite == 166 then
		container.small_icon = 220
		container.in_range_sprite = 216
		container.in_range_sprite_adjustment = { x = 0 , y = 7 }
		container.contents = get_early_bathroom()
	elseif container.sprite == 144 then
		container.small_icon = 218
		container.in_range_sprite = 217
		container.in_range_sprite_adjustment = { x = 0, y = 7 }
		container.contents = get_early_bedroom()
	elseif container.sprite == 145 then
		container.small_icon = 226
		container.in_range_sprite = 217
		container.in_range_sprite_adjustment = { x = 0, y = 7 }
		container.contents = get_early_bedroom()	
	end
	return container
end

function init_containers()
	_containers["1_2"] = init_container_defaults(container:new({ sprite = 137 }))
	_containers["1_4"] = init_container_defaults(container:new({ sprite = 140 }))
	_containers["20_5"] = init_container_defaults(container:new({ sprite = 187 }))
	_containers["23_6"] = init_container_defaults(container:new({ sprite = 170 }))
	_containers["24_6"] = init_container_defaults(container:new({ sprite = 160 }))
	_containers["25_6"] = init_container_defaults(container:new({ sprite = 161 }))
	_containers["26_6"] = init_container_defaults(container:new({ sprite = 160 }))
	_containers["26_2"] = init_container_defaults(container:new({ sprite = 166 }))
	_containers["21_1"] = init_container_defaults(container:new({ sprite = 144 }))
	_containers["22_1"] = init_container_defaults(container:new({ sprite = 145 }))
	_containers["35_1"] = init_container_defaults(container:new({ sprite = 144 }))
	_containers["36_1"] = init_container_defaults(container:new({ sprite = 145 }))
	_containers["34_1"] = init_container_defaults(container:new({ sprite = 187 }))
	_containers["38_2"] = init_container_defaults(container:new({ sprite = 149 }))
end

--[[
Randomised loot
]]

function get_random_contents(contents)
  local selected_contents = rnd(contents)
  del(contents, selected_contents)
  return selected_contents
end

--------------
-- Bedroom ---
--------------

local _early_bedroom = {}

add(
  _early_bedroom,
  {
	container_slot:new({
	  quantity = 1,
	  item = backpack:new({})
	  }),
	container_slot:new({
	  quantity = 2,
	  item = rag:new({})
	})
  }
)

function get_early_bedroom()
  return get_random_contents(_early_bedroom)
end

-------------
-- Kitchen --
-------------

local _early_kitchen = {}

add(
  _early_kitchen,
  {
	container_slot:new({
	  quantity = 1,
	  item = item:new({})
	  }),
  }
)

function get_early_kitchen()
  return get_random_contents(_early_kitchen)
end

function get_early_fridge()
	return get_random_contents(_early_kitchen)
end

function get_early_bookshelf()
	return get_random_contents(_early_kitchen)
end

function get_start_letterbox()
	return get_random_contents(_early_kitchen)
end

function get_early_bathroom()
	return get_random_contents(_early_kitchen)
end
-------------
-- Boxes --
-------------
local _early_boxes = {}

add(
  _early_boxes,
  {
	container_slot:new({
	  quantity = 1,
	  item = cardboard:new({})
	  }),
  }
)

function get_early_boxes()
  return get_random_contents(_early_boxes)
end

