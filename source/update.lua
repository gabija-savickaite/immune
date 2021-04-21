function updateGameplay(dt)
    
    towerProjectiles:update(dt)

    towers:update(dt)

    enemies:update(dt)
    
end

function updateGameOverMenu(dt)

    gameOverMenu:update(dt)

end
