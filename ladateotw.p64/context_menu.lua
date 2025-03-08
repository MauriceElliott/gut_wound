--[[pod_format="raw",created="2024-06-19 22:02:44",modified="2025-03-08 00:34:19",revision=3209]]
context_menu=entity:new({
	x = 0,
	y = 0,
	oo_ui = true,
	open = false,
	options={},
	max_width = 60,
	current_obj = nil,
})

context_option=entity:new({
	name = nil,
	m_is_on = false,
	action = nil
})

context_menu_actions = {
	consume = "Consume",
	discard = "Discard",
	use = "Use",
	equip = "Equip",
	unequip = "Unequip",
}

function draw_context_menu()
	if _cm.open then
		if _m_x > (_cm.x-10)
		and _m_x < (_cm.x+64)
		and _m_y > (_cm.y-10)
		and _m_y < (_cm.y+(table_length(_cm.options)*10)) then
			_cm.open = true
		else
			_cm.open = false
			_cm.options = {}
		end

		local current_offset = 0
		for i, o in pairs(_cm.options) do
			rectfill(_cm.x, _cm.y+current_offset, _cm.x+60, _cm.y+current_offset+12,0)
			rect(_cm.x, _cm.y+current_offset, _cm.x+60, _cm.y+current_offset+12,23)
			print(o.name, _cm.x+2, _cm.y+1+current_offset)
			if _m_x > _cm.x
			and _m_x < _cm.x+60
			and _m_y > _cm.y+current_offset
			and _m_y < _cm.y+current_offset+12 then
				rect(_cm.x+1, _cm.y+current_offset+1, _cm.x+59, _cm.y+current_offset+11,2)
				o.m_is_on = true
			end
			current_offset += 12
		end
	end
end

function update_context_menu(obj)
	local s_x, s_y = _m_x, _m_y+6
	_cm.open = true
	_cm.options = {}
	_cm.current_obj = obj
	_cm.x, _cm.y = s_x, s_y
	if obj.type == object_type.item then
		if obj.item_type == item_type.consumable then
			add(_cm.options, context_option:new({name = context_menu_actions.consume, action = obj.consume}))
			add(_cm.options, context_option:new({name = context_menu_actions.discard}))
		end
		if obj.item_type == item_type.junk then
			add(_cm.options, context_option:new({name = context_menu_actions.discard}))
		end
		if obj.item_type == item_type.equipable then
			_debug_message = "bp: " .. util.bool_to_int(obj.is_equipped)
			if obj.is_equipped == false then
				add(_cm.options, context_option:new({name = context_menu_actions.equip, action = obj.equip}))
			else
				add(_cm.options, context_option:new({name = context_menu_actions.unequip, action = obj.unequip}))
			end
		end
	end
end

function execute_context_menu_option()
	if _cm.open and _m_l_b then
		for i, o in pairs(_cm.options) do
			if o.m_is_on then
				o.action(_cm.current_obj)
			end
		end
		_cm.open = false 
	end
end
