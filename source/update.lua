local function updateGameplay(dt)
    
    towerProjectiles:update(dt)

    towers:update(dt)

    enemies:update(dt)
    
end

return updateGameplay
