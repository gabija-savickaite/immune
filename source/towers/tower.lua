towers = {}
local systems = require("source/systems")

function towers.spawn(x, y, type)
    
    local tower = towers.getTowerModel(x, y, type)

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
            towerProjectiles.spawn(self.x, self.y, tower)
            self.cooldown = self.maxCooldown
        end
    end

    table.insert(towers, tower)
end

local function update(dt)

    for _, v in ipairs(towers) do
        v:update(dt)
    end
    
    for i = #towers, 1, -1 do
        if towers[i].dead then

            for _, v in ipairs(towerPositions) do
                if v.x == towers[i].x and v.y == towers[i].y then
                    v.occupied = false
                end
            end

            table.remove(towers, i)
        end
    end
end

local function draw()
    
    for _, v in ipairs(towers) do
        love.graphics.setColor(v.color.r, v.color.g, v.color.b, v.health / v.maxHealth)
        love.graphics.circle("fill", v.x, v.y, v.radius)
    end

end

function towers.getTowerModel(x, y, type)

    local tower = {}

    tower.x = x
    tower.y = y
    tower.type = type

    if type == "marrow" then
        tower.color = { r = 0, g = 1, b = 0 }
        tower.radius = 30
    elseif type == "skin" then
        tower.color = { r = 1, g = 0.5, b = 0 }
        tower.radius = 35
    elseif type == "fever" then
        tower.color = { r = 1, g = 0, b = 0 }
        tower.radius = 20
    elseif type == "thymus" then
        tower.color = { r = 0, g = 0, b = 1 }
        tower.radius = 20
    elseif type == "phagocyte" then
        tower.color = { r = 1, g = 0, b = 1 }
        tower.radius = 20
    end

    return tower

end

systems.addUpdateFunction(update)
systems.addDrawFunction(draw, 4)