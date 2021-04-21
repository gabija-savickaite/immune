function love.load()

    local startup = require("source/startup/startup")
    startup()

    gameOverMenu:load()
end

function love.update(dt)

    require("source/update")

    if gameState.state == 1 then
        updateGameplay(dt)
    elseif gameState.state == 2 then
        updateGameOverMenu(dt)
    end

end

function love.draw()

    require("source/draw")

    if gameState.state == 1 then
        drawGameplay()
    elseif gameState.state == 2 then
        drawGameOverMenu()
    end

end

function love.mousepressed(x, y, button)
    if button == 1 then
        inventory.onPress(x, y)
    end
    gui:mousepress(x, y, button)
end

function love.mousemoved(x, y, dx, dy, button)
    inventory.onDrag(x, y)
end

function love.mousereleased(x, y, dx, dy, button)
    inventory.onRelease(x, y)
	gui:mouserelease(x, y, button)
end

function love.wheelmoved(x, y)
	gui:mousewheel(x, y)
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    inventory.onPress(x, y)
    gui:mousepress(x, y, button)
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    inventory.onDrag(x, y)
end

function love.touchreleased(id, x, y, dx, dy)
    inventory.onRelease(x, y)
	gui:mouserelease(x, y, button)
end
