--[[pod_format="raw",created="2025-03-23 23:23:11",modified="2025-05-06 21:56:04",revision=2961]]
include './fire.lua'
include './sitems.lua'
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

