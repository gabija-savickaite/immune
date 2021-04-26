return function()
    
    -- GAME WINDOW CONFIGURATION

    coreWidth = 720
    coreHeight = 960
    scale = 1
    shiftDown = 0
    osString = love.system.getOS()
    if osString == "Android" or osString == "iOS" then
        scale = love.graphics.getWidth()/coreWidth
        shiftDown = (love.graphics.getHeight() - (coreHeight * scale)) / 2 / scale
    else
        scale = 0.6
    end

    love.window.setMode(coreWidth * scale, coreHeight * scale)

    -- GAME SETUP

    require("source/startup/main_require")
    getGlobals()

    calculatePositions()
    populateInventory()

end