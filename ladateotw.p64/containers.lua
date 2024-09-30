--[[pod_format="raw",created="2024-06-18 20:28:00",modified="2024-09-30 22:57:46",revision=3152]]
include './types.lua'
include './util.lua'

container=entity:new({
	max_capacity = 10,
	small_icon = 0,
	in_range_sprite = 0,
	in_range = false,
	contents = {},
})

function init_containers()
	_containers["1_2"] = container:new({
		max_capacity=10,
		small_icon = 141,
		in_range_sprite = 130,
		in_range_sprite_adjustment = {x=0,y=-16},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = cardboard:new({})
				}
			)
		}
	})
	_containers["1_4"] = container:new({
		max_capacity=25,
		small_icon = 141,
		in_range_sprite = 133,
		in_range_sprite_adjustment = {x=-2,y=-16},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = letter:new({})
				}
			)
		}
	})
	_containers["20_5"] = container:new({
		max_capacity=25,
		small_icon = 141,
		in_range_sprite = 138,
		in_range_sprite_adjustment = {x=-1,y=-9},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = journal:new({})
				}
			)
		}
	})
	_containers["23_5"] = container:new({
		max_capacity=20,
		small_icon = 184,
		in_range_sprite = 208,
		in_range_sprite_adjustment = {x=-1,y=-1},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = water_bottle:new({})
				}
			),
			container_slot:new(
				{
					quantity = 2, 
					item = rancid_food:new({})
				}
			)
		}
	})
	_containers["24_5"] = container:new({
		max_capacity=20,
		small_icon = 184,
		in_range_sprite = 176,
		in_range_sprite_adjustment = {x=0,y=7},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = lunch_meat:new({})
				}
			),
			container_slot:new(
				{
					quantity = 1, 
					item = canned_sardines:new({})
				}
			)
		}
	})
	_containers["25_5"] = container:new({
		max_capacity=20,
		small_icon = 184,
		in_range_sprite = 176,
		in_range_sprite_adjustment = {x=0,y=7},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 4, 
					item = glass:new({})
				}
			),
			container_slot:new(
				{
					quantity = 1, 
					item = teapot:new({})
				}
			)
		}
	})
	_containers["26_5"] = container:new({
		max_capacity=20,
		small_icon = 184,
		in_range_sprite = 176,
		in_range_sprite_adjustment = {x=0,y=7},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = bleach:new({})
				}
			),
			container_slot:new(
				{
					quantity = 3, 
					item = sponge:new({})
				}
			),
			container_slot:new(
				{
					quantity = 1, 
					item = wash_cloth:new({})
				}
			)
		}
	})
	_containers["26_2"] = container:new({
		max_capacity=20,
		small_icon = 184,
		in_range_sprite = 176,
		in_range_sprite_adjustment = {x=0,y=7},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1, 
					item = painkillers:new({})
				}
			),
			container_slot:new(
				{
					quantity = 1, 
					item = wash_cloth:new({})
				}
			),
			container_slot:new(
				{
					quantity = 1,
					item = antiseptic:new({})
				}
			)
		}
	})
	_containers["21_2"] = container:new({
		max_capacity=20,
		small_icon = 184,
		in_range_sprite = 176,
		in_range_sprite_adjustment = {x=0,y=7},
		in_range = false,
		contents = {
			container_slot:new(
				{
					quantity = 1,
					item = backpack:new({})
				}
			),
		}
	})

end