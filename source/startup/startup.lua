return function()
    
    -- GAME WINDOW CONFIGURATION

    local coreWidth = 720
    local coreHeight = 960
    local scale = 1
    local shiftDown = 0
    local osString = love.system.getOS()
    if osString == "Android" or osString == "iOS" then
        scale = love.graphics.getWidth()/coreWidth
        shiftDown = (love.graphics.getHeight() - (coreHeight * scale)) / 2 / scale
    else
        scale = 0.6
    end

    love.window.setMode(coreWidth * scale, coreHeight * scale)

    -- GAME SETUP

    local getGlobals = require("source/startup/main_require")
    getGlobals()

    calculatePositions()
    inventory.populate()

end