-- Gutwound - Playdate Edition
-- Main entry point

import "CoreLibs/graphics"
import "CoreLibs/ui"
import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = pd.graphics
local roomImage = gfx.image.new("Assets/test_room")
print(roomImage)
local roomSprite = gfx.sprite.new(roomImage)

roomSprite:add()
roomSprite:moveTo(100, 100)

pd.display.setScale(2)
function pd.update()
    gfx.sprite.update()
end
