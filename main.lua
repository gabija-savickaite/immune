function love.load()

    local startup = require("source/startup/startup")
    startup()

end

function love.update(dt)

    local updateGameplay = require("source/update")
    updateGameplay(dt)

end

function love.draw()

    local drawGameplay = require("source/draw")
    drawGameplay()

end

function love.mousepressed(x, y, button)
    if button == 1 then
        inventory.onPress(x, y)
    end
end

function love.mousemoved(x, y, dx, dy, button)
    inventory.onDrag(x, y)
end

function love.mousereleased(x, y, dx, dy, button)
    inventory.onRelease(x, y)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    inventory.onPress(x, y)
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    inventory.onDrag(x, y)
end

function love.touchreleased(id, x, y, dx, dy)
    inventory.onRelease(x, y)
end
