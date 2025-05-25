--[[pod_format="raw",created="2025-05-05 21:12:05",modified="2025-05-25 22:02:22",revision=129]]
include './fire.lua'

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
	name = "Cloth",
	is_flamable = true,
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

poem = readable:new({
	sprite = (gfx_offset.gfx_3+144),
	name = "Poem",
	text = "The world continues to turn\n" ..
	        "There is still light from the sun\n" ..
			"The winds still blow,\n" ..
			"There is no more food to eat,\n" ..
			"The trees begin to fall\n" ..
			"and no matter how bright the sun may be\n" ..
			"I still feel no warmth\n"
})

note = readable:new({
   	sprite = (gfx_offset.gfx_3+144),
	name = "Note",
	text = "The world falls, famine reigns\n" ..
	       "The turns begin to slow.\n" ..
			"Yet somewhere out there, she continues\n" ..
			"How else would the lights be on?\n"
})

bible = readable:new({
   	sprite = (gfx_offset.gfx_3+144),
	name = "Holy Bible",
	text = "But the day of the Lord will come like a thief.\n" ..
	       "The heavens will disappear with a roar;\n" ..
			"the elements will be destroyed by fire,\n" ..
			"and the earth and everything done in it will be laid bare.\n"
})

manual = readable:new({
   	sprite = (gfx_offset.gfx_3+144),
	name = "Server Manual",
	text = "Hold the power button down for 10 seconds\n" ..
	        "When the white light flashes yellow, release the powerbutton\n" ..
			"If the server does not boot correctly after this\n" ..
			"Hold the AZ5 Button and the Q key while holding the powerbutton\n" ..
			"To clear the L5 video cache."
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
