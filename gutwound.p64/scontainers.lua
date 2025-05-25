--[[pod_format="raw",created="2025-05-05 21:13:06",modified="2025-05-25 22:02:22",revision=153]]
--[[
Containers
]]

include './sloot.lua'

ctnrspr = {
	cbox = 137,
	letterbox = 140,
	bookshelf = 187,
	fridge = 170,
	bdraws = 149,
	kcupboard1 = 160,
	kcupboard2 = 168,
	kcupboard3 = 175,
	kshelf = 161,
	bathroomsink = 166,
	lwardrobe = 144,
	rwardrobe = 145,
	storeshelf1 = 213,
	storeshelf2 = 238
}

container=entity:new({
	small_icon = 0,
	in_range_sprite = 0,
	in_range = false,
	search_timer = nil,
	update_timer = nil,
	is_searched = false,
	contents = {},
})

function init_defaults(container)
	--Cardboard boxes
	if container.sprite == ctnrspr.cbox then
		container.small_icon = 141
		container.in_range_sprite = 130
		container.in_range_sprite_adjustment = { x = 0, y = -16 }
		container.contents = get_early_boxes()
	--Letter lock boxes
	elseif container.sprite == ctnrspr.letterbox then
		container.small_icon = 141
		container.in_range_sprite = 133
		container.in_range_sprite_adjustment = { x = -2, y = -16 }
		container.in_range = false
		container.contents = get_start_letterbox()
	--Bookshelf
	elseif container.sprite == ctnrspr.bookshelf then
		container.small_icon = 210
		container.in_range_sprite = 138
		container.in_range_sprite_adjustment = { x = -1 ,y = -9 }
		container.contents = get_early_bookshelf()
	--Fridge
	elseif container.sprite == ctnrspr.fridge then
		container.small_icon = 211
		container.in_range_sprite = 208
		container.in_range_sprite_adjustment = { x= -1, y = -17 }
		container.contents = get_early_fridge()
	--Bedroom Draws
	elseif container.sprite == ctnrspr.bdraws then
		container.small_icon = 184
		container.in_range_sprite = 176
		container.in_range_sprite_adjustment = { x = 0, y = -9 }
		container.contents = get_early_bedroom()
	--Kitchen Cupboards
	elseif container.sprite == ctnrspr.kcupboard1 
		or container.sprite == ctnrspr.kcupboard2 
		or container.sprite == ctnrspr.kcupboard3 
	then
		container.small_icon = 184
		container.in_range_sprite = 176
		container.in_range_sprite_adjustment = { x = 0, y = -9 }
		container.contents = get_early_kitchen()
	--Kitchen shelfs
	elseif container.sprite == ctnrspr.kshelf then
		container.small_icon = 219
		container.in_range_sprite = 176
		container.in_range_sprite_adjustment = { x = 0, y = -9 }
		container.contents = get_early_kitchen()
	--Bathroom sink/cabinet.
	elseif container.sprite == ctnrspr.bathroomsink then
		container.small_icon = 220
		container.in_range_sprite = 216
		container.in_range_sprite_adjustment = { x = 0 , y = -3 }
		container.contents = get_early_bathroom()
	--Wardrobe left
	elseif container.sprite == ctnrspr.lwardrobe then
		container.small_icon = 218
		container.in_range_sprite = 217
		container.in_range_sprite_adjustment = { x = 4, y = 0 }
		container.contents = get_early_bedroom()
	--Wardobe right
	elseif container.sprite == ctnrspr.rwardrobe then
		container.small_icon = 226
		container.in_range_sprite = 217
		container.in_range_sprite_adjustment = { x = 0, y = 0 }
		container.contents = get_early_bedroom()
	elseif container.sprite == ctnrspr.storeshelf1
		or container.sprite == ctnrspr.storeshelf2
	then
		container.small_icon = 228
		container.in_range_sprite = 224
		container.in_range_sprite_adjustment = { x = 1, y = -21 }
		container.contents = get_early_bedroom() -- needs to change!
	end
	return container
end

--	cbox = 137
--	letterbox = 140
--	bookshelf = 187
--	fridge = 170
--	bdraws = 149
--	kcupboard1 = 160
--	kcupboard2 = 168
--	kcupboard3 = 175
--	kshelf = 161
--	bathroomsink = 166
--	lwardrobe = 144
--	rwardrobe = 145

function init_containers()
	_containers["1_2"] = init_defaults(container:new({ sprite = ctnrspr.cbox }))
	_containers["1_4"] = init_defaults(container:new({ sprite = ctnrspr.letterbox }))
	_containers["20_5"] = init_defaults(container:new({ sprite = ctnrspr.bookshelf }))
	_containers["23_6"] = init_defaults(container:new({ sprite = ctnrspr.fridge }))
	_containers["24_6"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard1 }))
	_containers["25_6"] = init_defaults(container:new({ sprite = ctnrspr.kshelf }))
	_containers["26_6"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard2 }))
	_containers["26_2"] = init_defaults(container:new({ sprite = ctnrspr.bathroomsink }))
	_containers["21_1"] = init_defaults(container:new({ sprite = ctnrspr.lwardrobe }))
	_containers["22_1"] = init_defaults(container:new({ sprite = ctnrspr.rwardrobe }))
	_containers["35_1"] = init_defaults(container:new({ sprite = ctnrspr.lwardrobe }))
	_containers["36_1"] = init_defaults(container:new({ sprite = ctnrspr.rwardrobe }))
	_containers["34_1"] = init_defaults(container:new({ sprite = ctnrspr.bookshelf }))
	_containers["38_2"] = init_defaults(container:new({ sprite = ctnrspr.bdraws }))
	_containers["40_2"] = init_defaults(container:new({ sprite = ctnrspr.bathroomsink }))
	_containers["41_2"] = init_defaults(container:new({ sprite = ctnrspr.bathroomsink }))
	_containers["42_6"] = init_defaults(container:new({ sprite = ctnrspr.bdraws }))
	_containers["40_5"] = init_defaults(container:new({ sprite = ctnrspr.bookshelf }))
	_containers["30_5"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard3 }))
	_containers["31_5"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard2 }))
	_containers["32_5"] = init_defaults(container:new({ sprite = ctnrspr.kshelf }))
	_containers["33_5"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard1 }))
	_containers["35_5"] = init_defaults(container:new({ sprite = ctnrspr.fridge }))
	_containers["1_16"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard1 }))
	_containers["2_16"] = init_defaults(container:new({ sprite = ctnrspr.kshelf }))
	_containers["3_16"] = init_defaults(container:new({ sprite = ctnrspr.fridge }))
	_containers["5_16"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard2 }))
	_containers["5_21"] = init_defaults(container:new({ sprite = ctnrspr.bookshelf }))
	_containers["3_21"] = init_defaults(container:new({ sprite = ctnrspr.lwardrobe }))
	_containers["4_21"] = init_defaults(container:new({ sprite = ctnrspr.rwardrobe }))
	_containers["3_27"] = init_defaults(container:new({ sprite = ctnrspr.bathroomsink }))
	_containers["4_27"] = init_defaults(container:new({ sprite = ctnrspr.bathroomsink }))
	_containers["12_27"] = init_defaults(container:new({ sprite = ctnrspr.fridge }))
	_containers["13_27"] = init_defaults(container:new({ sprite = ctnrspr.kcupboard2 }))
	_containers["14_27"] = init_defaults(container:new({ sprite = ctnrspr.kshelf }))
	_containers["16_27"] = init_defaults(container:new({ sprite = ctnrspr.bdraws }))
	_containers["17_27"] = init_defaults(container:new({ sprite = ctnrspr.lwardrobe }))
	_containers["18_27"] = init_defaults(container:new({ sprite = ctnrspr.rwardrobe }))
	_containers["21_27"] = init_defaults(container:new({ sprite = ctnrspr.bookshelf }))
	_containers["24_28"] = init_defaults(container:new({ sprite = ctnrspr.bathroomsink }))
	_containers["34_20"] = init_defaults(container:new({ sprite = ctnrspr.storeshelf2 }))
	_containers["34_22"] = init_defaults(container:new({ sprite = ctnrspr.storeshelf2 }))
	_containers["34_24"] = init_defaults(container:new({ sprite = ctnrspr.storeshelf1 }))
	_containers["38_20"] = init_defaults(container:new({ sprite = ctnrspr.storeshelf2 }))
	_containers["38_22"] = init_defaults(container:new({ sprite = ctnrspr.storeshelf2 }))
	_containers["38_24"] = init_defaults(container:new({ sprite = ctnrspr.storeshelf1 }))
end
