--[[pod_format="raw",created="2024-05-07 21:40:35",modified="2024-09-30 22:57:46",revision=6613]]
include './types.lua'
include './util.lua'

moodle=entity:new({
	moodle = "none",
	sprite = 0,
	x = 0,
	y = 0,
})

function get_index(moodles, name)
	for i, m in ipairs(moodles) do
		if m.moodle == name then
			return i
		end
	end
	return -1
end

-- moodle entity, name, value, sprite 1, 2, 3, 4, lower check
function generate_moodle(m, n, v, s1, s2, s3, s4, lc)
	index = get_index(m.moodles, n)
	current_moodle = nil
	new_sprite = -1
	if index != -1 then
		current_moodle = m.moodles[index]
	end
	if lc then
		if v >= 20 and v < 30 then
			new_sprite = s1
		elseif v >= 30 and v < 50 then
			new_sprite = s2
		elseif v >= 50 and v < 70 then
			new_sprite = s3
		elseif v >= 70 then
			new_sprite = s4
		end
	else
		if v < 70 and v >= 50 then
			new_sprite = s1
		elseif v < 50 and v >= 30 then
			new_sprite = s2
		elseif v < 30 and v >= 10 then
			new_sprite = s3
		elseif v < 10 then
			new_sprite = s4
		end
	end
	if current_moodle == nil and new_sprite != nil then
		return moodle:new({moodle=n,sprite=new_sprite})
	elseif current_moodle != nil and current_moodle.sprite != new_sprite then
		del(m.moodles,current_moodle)
		return moodle:new({moodle=n,sprite=new_sprite})
	elseif current_moodle != nil and new_sprite == nil then
		del(m.moodles,current_moodle)
		return nil
	elseif current_moodle != nil and current_moodle.sprite == new_sprite then
		del(m.moodles,current_moodle)
		return moodle:new({moodle=n,sprite=new_sprite})
	end
	return nil
end

--moodle object, character
function display_moodles(m,c)
	m.moodles = {}
	h = generate_moodle(
		m, 
		"health", 
		c.health, 
		moodle_sprites.health_1, 
		moodle_sprites.health_2, 
		moodle_sprites.health_3, 
		moodle_sprites.health_4, 
		false)
	if h.sprite > 0 then
		add(m.moodles,h)
	end

	wh = generate_moodle(
		m, 
		"wound_health", 
		c.wound_health, 
		moodle_sprites.wound_health_1, 
		moodle_sprites.wound_health_2, 
		moodle_sprites.wound_health_3, 
		moodle_sprites.wound_health_4,
		false)
	if wh.sprite > 0 then
		add(m.moodles,wh)
	end

	p = generate_moodle(
		m, 
		"pain", 
		c.pain, 
		moodle_sprites.pain_1, 
		moodle_sprites.pain_2, 
		moodle_sprites.pain_3, 
		moodle_sprites.pain_4,
		true)
	if p.sprite > 0 then
		add(m.moodles,p)
	end

	hu = generate_moodle(
		m, 
		"hunger", 
		c.hunger, 
		moodle_sprites.hunger_1, 
		moodle_sprites.hunger_2, 
		moodle_sprites.hunger_3, 
		moodle_sprites.hunger_4,
		true)
	if hu.sprite > 0 then
		add(m.moodles,hu)
	end

	t = generate_moodle(
		m, 
		"thirst", 
		c.thirst, 
		moodle_sprites.thirst_1, 
		moodle_sprites.thirst_2, 
		moodle_sprites.thirst_3, 
		moodle_sprites.thirst_4,
		true)
	if t.sprite > 0 then
		add(m.moodles,t)
	end

	d = generate_moodle(
		m, 
		"delirium",
		c.delirium,
		moodle_sprites.delirium_1, 
		moodle_sprites.delirium_2, 
		moodle_sprites.delirium_3, 
		moodle_sprites.delirium_4,
		true)
	if d.sprite > 0 then
		add(m.moodles,d)
	end
	
	current_y = 4
	for i, moodle in pairs(m.moodles) do
		spr(moodle.sprite, _c_x-20, _c_y + current_y)
		current_y += 20
	end
end

moodle_sprites={
	health_1 = (gfx_offset.gfx_3+40),
	health_2 = (gfx_offset.gfx_3+41),
	health_3 = (gfx_offset.gfx_3+42),
	health_4 = (gfx_offset.gfx_3+43),
	wound_health_1 = (gfx_offset.gfx_3+32),
	wound_health_2 = (gfx_offset.gfx_3+33),
	wound_health_3 = (gfx_offset.gfx_3+34),
	wound_health_4 = (gfx_offset.gfx_3+35),
	pain_1 = (gfx_offset.gfx_3+1),
	pain_2 = (gfx_offset.gfx_3+2),
	pain_3 = (gfx_offset.gfx_3+3),
	pain_4 = (gfx_offset.gfx_3+4),
	delirium_1 = (gfx_offset.gfx_3+8),
	delirium_2 = (gfx_offset.gfx_3+9),
	delirium_3 = (gfx_offset.gfx_3+10),
	delirium_4 = (gfx_offset.gfx_3+11),
	hunger_1 = (gfx_offset.gfx_3+24),
	hunger_2 = (gfx_offset.gfx_3+25),
	hunger_3 = (gfx_offset.gfx_3+26),
	hunger_4 = (gfx_offset.gfx_3+27),
	thirst_1 = (gfx_offset.gfx_3+16),
	thirst_2 = (gfx_offset.gfx_3+17),
	thirst_3 = (gfx_offset.gfx_3+18),
	thirst_4 = (gfx_offset.gfx_3+19),
}