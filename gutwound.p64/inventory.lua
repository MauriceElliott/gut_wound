--[[pod_format="raw",created="2024-05-14 20:53:29",modified="2025-04-28 19:55:06",revision=9669]]

-- text colour
_itc = 14
-- highlight item colour
_hic = 23
-- deselected container colour
_dcc = 28
inventory = entity:new({
    max_width = 119,
    max_height = 68,
    max_capacity = 10,
    inv_starting_x = 0,
    cont_starting_x = 0,
    c_i_starting_y = 5,
    oo_ui = true,
    open = false,
    total_weight = 0,
    base_capacity = 10,
    capacity = 10,
    extra_capacity = 0,
    max_capacity = 10,
    selected_container = 1,
    contents = {},
})

function dc_in_range_any(t)
    for i, dc in pairs(t) do
        if dc.in_range then
            return true
        end
    end
    return false
end

function remove_item_from_container(ccc, item)
    for i, cc in pairs(ccc.contents) do
        if cc.item.sprite == item.sprite then
            if cc.quantity <= 1 then
                del(ccc.contents, cc)
            else
                cc.quantity -= 1
            end
        end
    end
end

function add_to_inventory(cc, item)
    local existing_item_index = 0
    local total_weight = 0
    for i, s in pairs(_inv.contents) do
        if s.item.sprite == item.sprite and s.item.name == item.name then
            existing_item_index = i
            
        end
        total_weight += (s.item.weight * s.quantity)
    end
    if (total_weight + item.weight) > _inv.max_capacity then
        draw_info_text("Can't carry anymore.", 5)
        return
    end
    if existing_item_index > 0 then
        _inv.contents[existing_item_index].quantity += 1
    else
        slot = container_slot:new({ quantity = 1, item = item })
        add(_inv.contents, slot)
    end
    remove_item_from_container(cc, item)
end

function display_inventory_contents()
    local current_y = flr(_inv.c_i_starting_y + 13)
    local current_count = 1

    local current_max = _scroll_inv + _max_items
    if table_length(_inv.contents) < current_max then
        current_max = table_length(_inv.contents)
        _scroll_inv = (current_max - _max_items)
    end

    for i, c in ipairs(_inv.contents) do
        if current_count > current_max then
            break
        elseif current_count > _scroll_inv and current_count < (current_max + 1) then
            local m_is_on = false
            c.starting_x = _inv.inv_starting_x
            c.starting_y = current_y
            c.ending_x = _inv.inv_starting_x + 114
            c.ending_y = current_y + 8
            if (_m_x) > c.starting_x
                and (_m_x) < c.ending_x
                and (_m_y) > c.starting_y
                and (_m_y) < c.ending_y then
                m_is_on = true
                rect(c.starting_x - 1, c.starting_y - 2, c.ending_x + 1, c.ending_y + 1, _hic)
            end
            spr(c.item.sprite, _inv.inv_starting_x, current_y, 23)
            if c.item.is_equipped then
            	spr((gfx_offset.gfx_3+6), _inv.inv_starting_x-1, current_y) 
            end
            if c.item.is_hot then
            	spr((gfx_offset.gfx_3+7), _inv.inv_starting_x-1, current_y)
            end
            print(c.item.name, _inv.inv_starting_x + 11, current_y, _itc)
            print(c.item.weight, _inv.inv_starting_x + 80, current_y, _itc)
            print(c.quantity, _inv.inv_starting_x + 103, current_y, _itc)
            current_y += 10
            _inv.total_weight += (c.item.weight * c.quantity)
            if (m_is_on) then
                if _m_r_b then
                    update_context_menu(c.item)
                end
            end
        end
        current_count += 1
    end
end

_min_search_time = 3

function display_container_contents()
    local current_y = flr(_inv.c_i_starting_y + 13)
    print("Container(s)", _inv.cont_starting_x + 11, current_y - 11, _itc)
    local cont_icn_x = _inv.cont_starting_x + 2
    local cont_icn_y = current_y + 44
    
    for i, cc in pairs(_discovered_containers) do
        if cc.in_range == true then
            local cont_icn_b_s_x = cont_icn_x - 1
            local cont_icn_b_s_y = cont_icn_y - 1
            local cont_icn_b_e_x = cont_icn_x + 8
            local cont_icn_b_e_y = cont_icn_y + 8
            if i == _inv.selected_container or _inv.selected_container == 1 then
            	
               _inv.selected_container = i
               rect(cont_icn_b_s_x, cont_icn_b_s_y, cont_icn_b_e_x, cont_icn_b_e_y, _itc)
               spr(cc.small_icon, cont_icn_x, cont_icn_y)
					if cc.search_timer == nil then
						cc.search_timer = time()
						cc.update_timer = time()
						cc.dots = ".."
					elseif time_since(cc.search_timer, time(), false) < _min_search_time then
						if time_since(cc.update_timer, time(), false) >= 0.5 then
							cc.dots = cc.dots .. "."
							cc.update_timer = time()
						end
						local text = "searching" .. cc.dots
						print(text, _inv.cont_starting_x, current_y)
					else
						cc.is_searched = true
	               for j, ccc in ipairs(cc.contents) do
	                   local m_is_on = false
	                   ccc.starting_x = _inv.cont_starting_x
	                   ccc.starting_y = current_y
	                   ccc.ending_x = _inv.cont_starting_x + 114
	                   ccc.ending_y = current_y + 8
	                   if (_m_x) > ccc.starting_x
	                       and (_m_x) < ccc.ending_x
	                       and (_m_y) > ccc.starting_y
	                       and (_m_y) < ccc.ending_y then
	                       rect(ccc.starting_x - 1, ccc.starting_y - 2, ccc.ending_x + 1, ccc.ending_y + 1, _hic)
	                       m_is_on = true
	                   end
	                   spr(ccc.item.sprite, _inv.cont_starting_x, current_y)
	                   print(ccc.item.name, _inv.cont_starting_x + 11, current_y, _itc)
	                   print(ccc.item.weight, _inv.cont_starting_x + 80, current_y, _itc)
	                   print(ccc.quantity, _inv.cont_starting_x + 100, current_y, _itc)
	                   current_y += 10
	                   if (m_is_on) then
	                       if _m_l_b then
	                           add_to_inventory(cc, ccc.item)
	                       elseif _m_r_b then
	                           update_context_menu(ccc.item)
	                       end
	                   end
	               end
               end
           else
                rect(cont_icn_b_s_x, cont_icn_b_s_y, cont_icn_b_e_x, cont_icn_b_e_y, _dcc)
                spr(cc.small_icon, cont_icn_x, cont_icn_y)
                if _m_l_b and ((_m_x) > cont_icn_b_s_x
                        and (_m_x) < cont_icn_b_e_x
                        and (_m_y) > cont_icn_b_s_y
                        and (_m_y) < cont_icn_b_e_y) then
                    _inv.selected_container = i
                end
            end
            cont_icn_x += 10
        else
        		if cc.search_timer != nil and cc.is_searched == false then
        			cc.search_timer = nil
        		end
        end
    end
end

function show_inventory()
    if (_m_x) > _c_x - 360
        and (_m_x) < (_c_x - 121)
        and (_m_y) > _c_y
        and (_m_y) < (_c_y + 6)
    then
        _inv.oo_ui = false
        _inv.open = true
    else
        if _inv.open == true then
            if (_m_x) > _c_x - 360
                and (_m_x) < (_c_x - 121)
                and (_m_y) > _c_y
                and (_m_y) < (_inv.c_i_starting_y + _inv.max_height) then
                _inv.oo_ui = false
            else
                _inv.oo_ui = true
            end
        end
    end
    if _inv.open == true then
        spr(inv_sprites.open, _c_x - 360, _inv.c_i_starting_y)
        spr(inv_sprites.open, (_c_x - 240) + 1, _inv.c_i_starting_y)
    else
        spr(inv_sprites.closed, _c_x - 360, _inv.c_i_starting_y)
        spr(inv_sprites.closed, (_c_x - 240) + 1, _inv.c_i_starting_y)
    end
    if _inv.oo_ui == false then
        if _m_x < _c_x - 240 and _m_y > _inv.c_i_starting_y then
            _scroll_inv += (_m_w_y * -1)
        elseif _m_x > _c_x - 240 and _m_y > _inv.c_i_starting_y then
            _scroll_cont += (_m_w_y * -1)
        end
        if _scroll_inv < 0 then
            _scroll_inv = 0
        end
        if _scroll_cont < 0 then
            _scroll_cont = 0
        end
    end
    if not ((_m_y) < (_inv.c_i_starting_y + _inv.max_height)) and
        ((_m_l_b == true
                and _inv.oo_ui == true)
            or (_m_r_b == true
                and _inv.oo_ui == true))
    then
        _inv.open = false
        _scroll_cont = 0
        _scroll_inv = 0
    end
end

function display_inventory_weight()
    _inv.total_weight = 0
    for i, c in ipairs(_inv.contents) do
        _inv.total_weight += (c.item.weight * c.quantity)
    end
    local s_x = _inv.inv_starting_x - 1
    local s_y = _inv.c_i_starting_y + 1
    local p_c = (_inv.total_weight / _inv.capacity) * 100
    local p_r = (7.3 / 100) * p_c
    local e_x = s_x + p_r
    local e_y = s_y + p_r
    local colour = 0
    if p_c <= 25 then
        colour = 30
    elseif p_c > 25 and p_c <= 50 then
        colour = 13
    elseif p_c > 50 and p_c <= 75 then
        colour = 15
    else
        colour = 26
    end
    rectfill(s_x, s_y, e_x, e_y, colour)
end

function update_inventory()
    _inv.inv_starting_x = flr(_c_x - 358)
    _inv.cont_starting_x = flr(_c_x - 237)
    _inv.c_i_starting_y = flr(_c_y + 4)
    show_inventory(c_i)
    if _inv.open then
        display_inventory_contents(c_i)
        display_inventory_weight(c_i)
        if table_length(_discovered_containers) > 0 and dc_in_range_any(_discovered_containers) then
            display_container_contents(c_i)
        else
            _inv.selected_container = 1
        end
    end
end

inv_sprites = {
    closed = (gfx_offset.gfx_3 + 4),
    open = (gfx_offset.gfx_3 + 5)
}
