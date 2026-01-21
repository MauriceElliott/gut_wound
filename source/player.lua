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

    local playerImage = gfx.image.new("images/man")
    self:setImage(playerImage)

    self:moveTo(x, y)

    self:add()
end

function Player:update()
    local xMove, yMove = 0, 0
    if pd.buttonIsPressed(pd.kButtonUp) then
        yMove = -1.5
    elseif pd.buttonIsPressed(pd.kButtonDown) then
        yMove = 1.5
    elseif pd.buttonIsPressed(pd.kButtonLeft) then
        xMove = -1.5
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        xMove = 1.5
    end

    self:moveBy(xMove, yMove)
end
