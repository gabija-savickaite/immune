towers = {}
local systems = require("source/systems")

function spawnTower(x, y, type)
    
    local tower = getTowerModel(x, y, type)

    tower.dead = false

    if type == "marrow" then
        tower.maxCooldown = 2
        tower.maxHealth = 100
    elseif type == "skin" then
        tower.maxCooldown = 2
        tower.maxHealth = 200
    elseif type == "fever" then
        tower.maxCooldown = 3
        tower.maxHealth = 80
    elseif type == "thymus" then
        tower.maxCooldown = 3
        tower.maxHealth = 80
    elseif type == "phagocyte" then
        tower.maxCooldown = 3
        tower.maxHealth = 80
    end

    tower.cooldown = tower.maxCooldown
    tower.health = tower.maxHealth
    
    function tower:update(dt)
        self.cooldown = self.cooldown - dt
        if self.type ~= "skin" and self.cooldown <= 0 then
            spawnTowerProj(self.x, self.y, tower)
            self.cooldown = self.maxCooldown
        end
    end

    table.insert(towers, tower)
end

function update(dt)

    for _, t in ipairs(towers) do
        t:update(dt)
    end
    
    for i=#towers, 1, -1 do
        if towers[i].dead then
            for _,p in ipairs(towerPositions) do
                if p.x == towers[i].x and p.y == towers[i].y then
                    p.occupied = false
                end
            end
            table.remove(towers, i)
        end
    end
end

function draw()
    
    for _, t in ipairs(towers) do
        love.graphics.setColor(t.colour.r, t.colour.g, t.colour.b, t.health / t.maxHealth)
        love.graphics.circle("fill", t.x, t.y, t.radius)
    end

end

function getTowerModel(x, y, type)

    local tower = {}

    tower.x = x
    tower.y = y
    tower.type = type

    if type == "marrow" then
        tower.colour = { r = 0, g = 1, b = 0 }
        tower.radius = 30
    elseif type == "skin" then
        tower.colour = { r = 1, g = 0.5, b = 0 }
        tower.radius = 35
    elseif type == "fever" then
        tower.colour = { r = 1, g = 0, b = 0 }
        tower.radius = 20
    elseif type == "thymus" then
        tower.colour = { r = 0, g = 0, b = 1 }
        tower.radius = 20
    elseif type == "phagocyte" then
        tower.colour = { r = 1, g = 0, b = 1 }
        tower.radius = 20
    end

    return tower

end

systems.addUpdateFunction(update)
systems.addDrawFunction(draw, 4)