-- Gutwound - Playdate Edition
-- Main entry point

import "CoreLibs/graphics"
import "CoreLibs/ui"
import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = pd.graphics
local roomImage = gfx.image.new("assets/test_room")
local manImage = gfx.image.new("assets/man")

local roomSprite = gfx.sprite.new(roomImage)
local manSprite = gfx.sprite.new(manImage)
local manX = 200
local manY = 120

roomSprite:add()
roomSprite:moveTo(200, 120)

manSprite:add()
manSprite:moveTo(manX, manY)

function pd.update()
    gfx.sprite.update()

    if pd.buttonIsPressed(pd.kButtonUp) then
        manY -= 1
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        manY += 1
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        manX -= 1
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        manX += 1
    end

    manSprite:moveTo(manX, manY)
end
