--[[pod_format="raw",created="2024-11-11 13:08:11",modified="2025-03-22 00:47:17",revision=879]]
include './util.lua'
include './items.lua'
include './input.lua'
include './fillers.lua'
include './types.lua'
include './character.lua'
include './moodles.lua'
include './inventory.lua'
include './static_interactable.lua'
include './containers.lua'
include './context_menu.lua'
include './rooms.lua'
include './scenes.lua'
include './input.lua'
include './camera.lua'
include './fire.lua'

function get_random_contents(contents)
  local selected_contents = rnd(contents)
  del(contents, selected_contents)
  return selected_contents
end

--------------
-- Clothes ---
--------------

local _early_clothes = {}

local _mid_clothes = {}

local _late_clothes = {}

add(
  _early_clothes,
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

add(
  _early_clothes,
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


function get_early_clothes()
  return get_random_contents(_early_clothes)
end

function get_mid_clothes()
  return get_random_contents(_mid_clothes)
end

function get_late_clothes()
  return get_random_contents(_late_clothes)
end

-------------
-- Kitchen --
-------------

local _early_kitchen = {}

local _mid_kitchen = {}

local _late_kitchen = {}

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

function get_mid_kitchen()
  return get_random_contents(_mid_kitchen)
end

function get_late_kitchen()
  return get_random_contents(_late_kitchen)
end
