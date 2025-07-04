--[[pod_format="raw",created="2025-05-05 21:15:40",modified="2025-06-01 22:10:34",revision=163]]
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
	container_slot:new({ item = canned_mushrooms:new({})}),
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

add(_early_kitchen,{})

add(
  _early_kitchen,
  {
	container_slot:new({ item = canned_tofu:new({})}),
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

local _early_fridge = {}

add(_early_fridge, {
	container_slot:new({ item = fizzy_drink_can:new({})}),
})

add(_early_fridge, {
	container_slot:new({ item = rancid_food:new({})}),
})

add(_early_fridge, {
    --EMPTY
})

add(_early_fridge, {
	container_slot:new({ item = jarred_kimchi:new({})}),
	container_slot:new({ item = jarred_veg:new({})}),
	container_slot:new({ item = iced_tea:new({})}),
})

function get_early_fridge()
	return get_random_contents(_early_fridge)
end

local _early_books = {}

add(_early_books, {
	container_slot:new({ item = note:new({})}),
})

add(_early_books, {
	container_slot:new({ item = poem:new({})}),
})

add(_early_books, {
	container_slot:new({ item = bible:new({})}),
})

add(_early_books, {
	container_slot:new({ item = manual:new({})}),
})

add(_early_books, {
	container_slot:new({ item = bible:new({})}),
	container_slot:new({ item = painkillers:new({})}),
})

function get_early_bookshelf()
	return get_random_contents(_early_books)
end

local _letter_box = {
    {
        container_slot:new({ item = letter:new({})}),
        container_slot:new({ item = energy_drink:new({})}),
    },
    {
        container_slot:new({ item = letter:new({})}),
        container_slot:new({ item = iced_tea:new({})}),
    }
}

function get_start_letterbox()
	return get_random_contents(_letter_box)
end

-- total of 8
local _early_bathroom = {
    {
        container_slot:new({ item = razor:new({})}),
        container_slot:new({ item = hairspray:new({})}),
    },
    {
        container_slot:new({ item = soap:new({})}),
    },
    {
        container_slot:new({ item = toothbrush:new({})}),
        container_slot:new({ item = suture_needle:new({})}),
    },
    {
        container_slot:new({ item = painkillers:new({})}),
    },
    {
        container_slot:new({ item = antiseptic:new({})}),
        container_slot:new({ item = soap:new({})}),
    },
    {
        container_slot:new({ item = toothbrush:new({})}),  
    },
    {
        --EMPTY
    },
    {
        --EMPTY
    } 
}

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

-------------
-- Water Room --
-------------
local _water_room = {}

add(
  _water_room,
  {
	container_slot:new({
	  quantity = 1,
	  item = water_bottle:new({})
	  }),
  }
)

function get_water_room()
  return get_random_contents(_water_room)
end