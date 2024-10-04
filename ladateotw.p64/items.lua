--[[pod_format="raw",created="2024-05-30 22:52:53",modified="2024-10-04 12:20:30",revision=5273]]
item=entity:new({
	type = object_type.item,
	sprite = 0,
	name = "",
	weight = 1.0,
	is_flamable = false,
	item_type = nil,
	description=""
})

item_type = {
	consumable = 1,
	junk = 2,
	useable = 3,
	special = 4,
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
	exhaustion = 0,
	delirium = 0,
	wound_health = 0,
	health = 0,
	pain = 0,
	can_heat = false,
	hot_offset = 0,
	cold_offset = 0,
	consume = function(self, o)
		local offset = 0
		if is_hot then
			offset = self.hot_offset
		else
			offset = self.cold_offset
		end
		o.thirst -= (self.thirst + offset)
		o.hunger -= (self.hunger + offset)
		o.exhaustion -= (self.exhaustion + offset)
		o.delirium -= (self.delirium + offset)
		o.pain -= self.pain
		o.wound_health += self.wound_health
		o.health += self.health
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
})

energy_drink=consumable:new({
	sprite = (gfx_offset.gfx_3+129),
	name = "Energy Drink",
	weight = 0.5,
	thirst = 10,
	exhaustion = 10,
	delirium = 5,
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
--------------
-- Readable --
--------------
readable=item:new({
	item_type = item_type.readable,
	open_sprite = 0,
	is_flamable = true,
	weight = 0.8,
	read = function(self)
		
	end
})

journal=readable:new({
	open_sprite = (gfx_offset.gfx_3+120),
	sprite=(gfx_offset.gfx_3+145),
	name="Journal"
})

letter=readable:new({
	sprite=(gfx_offset.gfx_3+144),
	name="Letter"
})
----------
-- Junk --
----------
junk=item:new({
	item_type = item_type.junk,
})

cardboard=junk:new({
	sprite=(gfx_offset.gfx_3+143),
	name="Cardboard"
})

rancid_food=junk:new({
	sprite=(gfx_offset.gfx_3+151),
	name="Rancid Food"
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
useable=item:new({
	item_type = item_type.useable,
})

wash_cloth=useable:new({
	sprite=(gfx_offset.gfx_3+152),
	name="Wash Cloth",
	use=function(self,i)
		add(i.contents,	container_slot:new({quantity = 2, item = cloth_strips:new({})}))
		del(i,self)
	end
})



---------------
-- equipable --
---------------
equipable=item:new({
	item_type = item_type.useable,
})


backpack=equipable:new({
	sprite=(gfx_offset.gfx_3+154),
	name="Backpack",
	is_equipped=false,
	equip=function(self,o)
		add(o.equipped_items, self)
	end,
	unequip=function(self,o)
		del(o.equpped_items, self)
	end
	
})