-- Gutwound - Playdate Edition
-- Main entry point

import "CoreLibs/graphics"
import "CoreLibs/ui"

local pd <const> = playdate
local gfx <const> = playdate.graphics

function playdate.update()
    gfx.clear()
    gfx.drawTextAligned("Gutwound", 200, 120, kTextAlignment.center)
end
