import "CoreLibs/sprites"
import "CoreLibs/graphics"
import "CoreLibs/ui"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(playdate.graphics.sprite)

function Player:init(x, y)
    assert(x ~= nil, "player x position is nil, failing out.")
    assert(y ~= nil, "player y position is nil, failing out.")

    Player.super.init(self)

    self:setImage(gfx.image.new("images/man"))
    self:moveTo(x, y)
    self:add()

    -- Stats
    self.health = 100
    self.wound = 100
    self.thirst = 0
    self.hunger = 0
    self.pain = 0
    self.exhaustion = 0
    self.temperature = 15
    self.delirium = 0

    self.moveSpeedMod = 1
end

function Player:update()
    self:move()
    self:updateVitals()
end

function Player:move()
    local xMove, yMove = 0, 0
    if pd.buttonIsPressed(pd.kButtonUp) then
        yMove = -1
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        yMove = 1
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        xMove = -1
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        xMove = 1
    end

    self:moveBy(
        (xMove * self.moveSpeedMod),
        (yMove * self.moveSpeedMod)
    )
end

function Player:updateVitals()
end

function Player:updateHealth()
end

function Player:updateWound()
end

function Player:updateThirst()
end
