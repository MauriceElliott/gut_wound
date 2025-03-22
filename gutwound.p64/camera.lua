--[[pod_format="raw",created="2024-10-04 13:59:46",modified="2025-03-22 00:47:17",revision=1093]]
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

function update_camera()
    _c_x = _char.x + (_w_w/2)
	_c_y = (_char.y + (_w_h/2)) - 270
	_c_y_b = (_char.y + (_w_h/2))
	camera(_char.x - (_w_w/2),_char.y - (_w_h/2))
end