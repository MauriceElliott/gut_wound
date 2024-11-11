--[[pod_format="raw",created="2024-11-11 13:08:11",modified="2024-11-11 14:05:38",revision=13]]
include './items.lua'

-- Clothes
local _early_clothes_contents = {
  {
    container_slot:new({
          quantity = 1,
          item = backpack:new({})
    }),
  },
}

local _mid_clothes_contents = {
}

local _late_clothes_contents = {
}

function get_random_contents(contents)
  local selected_contents = rnd(contents)
  del(contents, selected_contents)
  return selected_contents
end

function get_early_clothes()
  return get_random_contents(_early_clothes_contents)
end

function get_mid_clothes()
  return get_random_contents(_mid_clothes_contents)
end

function get_late_clothes()
  return get_random_contents(_late_clothes_contents)
end
