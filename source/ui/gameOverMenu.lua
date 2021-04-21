gameOverMenu = gui()

function gameOverMenu:load()

    local retryButton = gui:button('Retry', {x = love.graphics.getWidth() / 2 - 64, y = love.graphics.getHeight() - gui.style.unit * 7, w = 128, h = gui.style.unit * 1.5})
	retryButton.click = function(this, x, y)
		gameStateInit()
	end

	local mainMenuButton = gui:button('Main menu', {x = love.graphics.getWidth() / 2 - 64, y = love.graphics.getHeight() - gui.style.unit * 5, w = 128, h = gui.style.unit * 1.5})
	mainMenuButton.click = function(this, x, y)
		
	end

end

function gameOverMenu:update(dt)

	gui:update(dt)

end

function gameOverMenu:draw()

	gui:draw()

end