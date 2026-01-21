-- Gutwound - Playdate Edition
-- Main entry point

import "CoreLibs/graphics"
import "CoreLibs/ui"
import "CoreLibs/sprites"
import "player"

function pd.init()
    local pd <const> = playdate
    local gfx <const> = pd.graphics
    local roomImage = gfx.image.new("images/test_room")
    local roomSprite = gfx.sprite.new(roomImage)

    roomSprite:add()
    local man = Player(200, 120)
    roomSprite:moveTo(200, 120)
end

function pd.update()
    gfx.sprite.update()
end
