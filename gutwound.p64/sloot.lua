--[[pod_format="raw",created="2025-05-05 21:15:40",modified="2025-05-25 20:35:36",revision=121]]
include './fire.lua'
include './sitems.lua'

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
	container_slot:new({ item = backpack:new({}) }),
	container_slot:new({ item = rag:new({}), quantity = 2 })
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
	container_slot:new({ item = canned_tofu:new({})}),
	container_slot:new({ item = canned_beans:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = jarred_veg:new({})}),
	container_slot:new({ item = canned_clams:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = rancid_food:new({})}),
	container_slot:new({ item = water_bottle:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = rancid_food:new({})}),
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = water_bottle:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = energy_drink:new({})}),
	container_slot:new({ item = fizzy_drink_can:new({}), quantity = 2})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = glass:new({}), quantity = 3}),
	container_slot:new({ item = teapot:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = bleach:new({})}),
	container_slot:new({ item = sponge:new({})}),
	container_slot:new({ item = cloth_strips:new({}), quantity = 2})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = iced_tea:new({})}),
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = rancid_food:new({})}),
	container_slot:new({ item = water_bottle:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = canned_beans:new({})}),
	container_slot:new({ item = lunch_meat:new({})})
  }
)

add(
  _early_kitchen,
  {
	container_slot:new({ item = canned_sardines:new({})}),
	container_slot:new({ item = canned_minced_prawn:new({})})
  }
)




function get_early_kitchen()
  return get_random_contents(_early_kitchen)
end

local _early_fridge
function get_early_fridge()
	return get_random_contents(_early_fridge)
end

local _early_books
function get_early_bookshelf()
	return get_random_contents(_early_books)
end

local _letter_box
function get_start_letterbox()
	return get_random_contents(_letter_box)
end

local _early_bathroom
function get_early_bathroom()
	return get_random_contents(_early_bathroom)
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
