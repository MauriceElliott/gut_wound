import "CoreLibs/sprites"
import "CoreLibs/graphics"
import "CoreLibs/ui"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(playdate.graphics.sprite)

function Player:init(x, y)
    Player.super.init(self)  -- Call the sprite parent class initializer

    -- Set up your player sprite image
    local playerImage = gfx.image.new("images/man")
    self:setImage(playerImage)

    -- Position the sprite
    self:moveTo(x, y)

    -- Add to sprite system
    self:add()
end

-- Add custom methods for your player
function Player:update()
        if pd.buttonIsPressed(pd.kButtonUp) then
        manY -= 1.5
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        manY += 1.5
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        manX -= 1.5
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        manX += 1.5
    end

    self:moveTo(manX, manY)    -- Player-specific update logic
end
