--[[pod_format="raw",created="2024-05-14 20:53:29",modified="2024-10-04 12:20:30",revision=6835]]
include './types.lua'
include './util.lua'
include './items.lua'

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

function add_to_inventory(c_i, cc, item)
    local existing_item_index = 0
    local total_weight = 0
    for i, s in pairs(c_i.contents) do
        if s.item.sprite == item.sprite then
            existing_item_index = i
        end
        total_weight += (s.item.weight * s.quantity)
    end
    if (total_weight + item.weight) > c_i.max_capacity then
        draw_info_text("Can't carry anymore.", 5)
        return
    end
    if existing_item_index > 0 then
        c_i.contents[existing_item_index].quantity += 1
    else
        slot = container_slot:new({ quantity = 1, item = item })
        add(c_i.contents, slot)
    end
    remove_item_from_container(cc, item)
end

function display_inventory_contents(c_i)
    local current_y = flr(c_i.c_i_starting_y + 13)
    print("Inventory", c_i.inv_starting_x + 11, current_y - 11, 23)
    local current_count = 1

    local current_max = _scroll_inv + _max_items
    if table_length(c_i.contents) < current_max then
        current_max = table_length(c_i.contents)
        _scroll_inv = (current_max - _max_items)
    end

    for i, c in ipairs(c_i.contents) do
        if current_count > current_max then
            break
        elseif current_count > _scroll_inv and current_count < (current_max + 1) then
            local m_is_on = false
            c.starting_x = c_i.inv_starting_x
            c.starting_y = current_y
            c.ending_x = c_i.inv_starting_x + 114
            c.ending_y = current_y + 8
            if (_m_x) > c.starting_x
                and (_m_x) < c.ending_x
                and (_m_y) > c.starting_y
                and (_m_y) < c.ending_y then
                m_is_on = true
                rect(c.starting_x - 1, c.starting_y - 2, c.ending_x + 1, c.ending_y + 1, 2)
            end
            spr(c.item.sprite, c_i.inv_starting_x, current_y, 23)
            print(c.item.name, c_i.inv_starting_x + 11, current_y, 23)
            print(c.item.weight, c_i.inv_starting_x + 80, current_y, 23)
            print(c.quantity, c_i.inv_starting_x + 103, current_y, 23)
            current_y += 10
            c_i.total_weight += (c.item.weight * c.quantity)
            if (m_is_on) then
                if _m_r_b then
                    update_context_menu(c.item)
                end
            end
        end
        current_count += 1
    end
end

function display_container_contents(c_i)
    local current_y = flr(c_i.c_i_starting_y + 13)
    print("Container(s)", c_i.cont_starting_x + 11, current_y - 11, 23)
    local cont_icn_x = c_i.cont_starting_x + 2
    local cont_icn_y = current_y + 45
    --TODO: Add scroll logic here.
    for i, cc in pairs(_discovered_containers) do
        if cc.in_range == true then
            local cont_icn_b_s_x = cont_icn_x - 1
            local cont_icn_b_s_y = cont_icn_y - 1
            local cont_icn_b_e_x = cont_icn_x + 8
            local cont_icn_b_e_y = cont_icn_y + 8
            if i == c_i.selected_container or c_i.selected_container == 1 then
                c_i.selected_container = i
                rect(cont_icn_b_s_x, cont_icn_b_s_y, cont_icn_b_e_x, cont_icn_b_e_y, 2)
                spr(cc.small_icon, cont_icn_x, cont_icn_y)
                for j, ccc in ipairs(cc.contents) do
                    local m_is_on = false
                    ccc.starting_x = c_i.cont_starting_x
                    ccc.starting_y = current_y
                    ccc.ending_x = c_i.cont_starting_x + 114
                    ccc.ending_y = current_y + 8
                    if (_m_x) > ccc.starting_x
                        and (_m_x) < ccc.ending_x
                        and (_m_y) > ccc.starting_y
                        and (_m_y) < ccc.ending_y then
                        rect(ccc.starting_x - 1, ccc.starting_y - 2, ccc.ending_x + 1, ccc.ending_y + 1, 2)
                        m_is_on = true
                    end
                    spr(ccc.item.sprite, c_i.cont_starting_x, current_y)
                    print(ccc.item.name, c_i.cont_starting_x + 11, current_y, 23)
                    print(ccc.item.weight, c_i.cont_starting_x + 80, current_y, 23)
                    print(ccc.quantity, c_i.cont_starting_x + 100, current_y, 23)
                    current_y += 10
                    if (m_is_on) then
                        if _m_l_b then
                            add_to_inventory(c_i, cc, ccc.item)
                        elseif _m_r_b then
                            update_context_menu(ccc.item)
                        end
                    end
                end
            else
                rect(cont_icn_b_s_x, cont_icn_b_s_y, cont_icn_b_e_x, cont_icn_b_e_y, 21)
                spr(cc.small_icon, cont_icn_x, cont_icn_y)
                if _m_l_b and ((_m_x) > cont_icn_b_s_x
                        and (_m_x) < cont_icn_b_e_x
                        and (_m_y) > cont_icn_b_s_y
                        and (_m_y) < cont_icn_b_e_y) then
                    c_i.selected_container = i
                end
            end
            cont_icn_x += 10
        end
    end
end

function show_inventory(c_i)
    if (_m_x) > _c_x - 360
        and (_m_x) < (_c_x - 121)
        and (_m_y) > _c_y
        and (_m_y) < (_c_y + 6)
    then
        c_i.oo_ui = false
        c_i.open = true
    else
        if c_i.open == true then
            if (_m_x) > _c_x - 360
                and (_m_x) < (_c_x - 121)
                and (_m_y) > _c_y
                and (_m_y) < (c_i.c_i_starting_y + c_i.max_height) then
                c_i.oo_ui = false
            else
                c_i.oo_ui = true
            end
        end
    end
    if c_i.open == true then
        spr(inv_sprites.open, _c_x - 360, c_i.c_i_starting_y)
        spr(inv_sprites.open, (_c_x - 240) + 1, c_i.c_i_starting_y)
    else
        spr(inv_sprites.closed, _c_x - 360, c_i.c_i_starting_y)
        spr(inv_sprites.closed, (_c_x - 240) + 1, c_i.c_i_starting_y)
    end
    if c_i.oo_ui == false then
        if _m_x < _c_x - 240 and _m_y > c_i.c_i_starting_y then
            _scroll_inv += (_m_w_y * -1)
        elseif _m_x > _c_x - 240 and _m_y > c_i.c_i_starting_y then
            _scroll_cont += (_m_w_y * -1)
        end
        if _scroll_inv < 0 then
            _scroll_inv = 0
        end
        if _scroll_cont < 0 then
            _scroll_cont = 0
        end
    end
    if not ((_m_y) < (c_i.c_i_starting_y + c_i.max_height)) and
        ((_m_l_b == true
                and c_i.oo_ui == true)
            or (_m_r_b == true
                and c_i.oo_ui == true))
    then
        c_i.open = false
        _scroll_cont = 0
        _scroll_inv = 0
    end
end

function display_inventory_weight(c_i)
    c_i.total_weight = 0
    for i, c in ipairs(c_i.contents) do
        c_i.total_weight += (c.item.weight * c.quantity)
    end
    local s_x = c_i.inv_starting_x - 1
    local s_y = c_i.c_i_starting_y + 1
    local p_c = (c_i.total_weight / c_i.capacity) * 100
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

function update_inventory(c_i)
    c_i.inv_starting_x = flr(_c_x - 358)
    c_i.cont_starting_x = flr(_c_x - 237)
    c_i.c_i_starting_y = flr(_c_y + 4)
    show_inventory(c_i)
    if c_i.open then
        display_inventory_contents(c_i)
        display_inventory_weight(c_i)
        if table_length(_discovered_containers) > 0 and dc_in_range_any(_discovered_containers) then
            display_container_contents(c_i)
        else
            c_i.selected_container = 1
        end
    end
end

inv_sprites = {
    closed = (gfx_offset.gfx_3 + 4),
    open = (gfx_offset.gfx_3 + 5)
}
