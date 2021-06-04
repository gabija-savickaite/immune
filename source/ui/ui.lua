gameOverMenu = gui()
mainMenu = gui()

function loadUI()

	loadGameOverMenu()
	loadMainMenu()

end

function loadGameOverMenu()

    local retryButton = gameOverMenu:button('Retry', {x = love.graphics.getWidth() / 2 - 64, y = love.graphics.getHeight() - gameOverMenu.style.unit * 7, w = 128, h = gameOverMenu.style.unit * 1.5})
	retryButton.click = function(this, x, y)
		gameState.state = State.Gameplay
	end

	local mainMenuButton = gameOverMenu:button('Main menu', {x = love.graphics.getWidth() / 2 - 64, y = love.graphics.getHeight() - gameOverMenu.style.unit * 5, w = 128, h = gameOverMenu.style.unit * 1.5})
	mainMenuButton.click = function(this, x, y)
		gameState.state = State.MainMenu
		gui = mainMenu
	end

end

function loadMainMenu()

	group2 = gui:group('Group 2', {0, 0, love.graphics.getWidth(), love.graphics.getHeight()})
	scrollgroup = gui:scrollgroup(nil, {0, 0, love.graphics.getWidth(), love.graphics.getHeight()}, group2)
	scrollgroup.scrollh.tip = 'Scroll (mouse or wheel)' -- scrollgroup.scrollh is the horizontal scrollbar
	scrollgroup.scrollh.style.hs = scrollgroup.style.unit*2
	scrollgroup.scrollv.tip = scrollgroup.scrollh.tip -- scrollgroup.scrollv is the vertical scrollbar
	--scrollgroup.scroller:setshape('circle') -- to set a round handle
	scrollgroup.scrollh.drop = function(this) gui:feedback('Scrolled to : '..this.values.current..' / '..this.values.min..' - '..this.values.max) end
	scrollgroup.scrollv.drop = scrollgroup.scrollh.drop
	scrollgroup.scrollv.style.hs = "auto"

	local size = love.graphics.getWidth() / 4
	local buttonSize = size / 2

	for i = 0, 3, 1 do
		for j = 0, 20, 1 do
			local levelButton = mainMenu:button(j * 4 + i + 1, {x = i * size + buttonSize / 2, y = j * size + buttonSize / 2, w = buttonSize, h = buttonSize}, group2)
			levelButton.click = function(this, x, y)
				gameState.state = State.Gameplay
			end
		end
	end

end