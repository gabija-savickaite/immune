enemies = {}
local spawnInterval = 1
local timer = 0

local systems = require("source/systems")

function spawnEnemy(x)

    local enemy = {}

    enemy.x = x
    enemy.y = 0
    enemy.speed = 10

    -- one kind of enemies for now
    enemy.dead = false
    enemy.health = 100
    enemy.maxHealth = 100
    enemy.cooldown = 3
    enemy.maxCooldown = 3

    enemy.color = { r = 0, g = 0, b = 0 }
    enemy.radius = 20

    function enemy:update(dt)
        
        local canMove = true

        for _, v in ipairs(towers) do

            if distance(v.x, v.y, self.x, self.y) < v.radius + self.radius and self.y < v.y then

                canMove = false

                if self.health <= 0 then
                    self.dead = true
                end

                self.cooldown = self.cooldown - dt
                if self.cooldown <= 0 then
                    v.health = t.health - 10
                    if v.health <= 0 then
                        v.dead = true
                    end
                    self.cooldown = self.maxCooldown
                end
            end
        end
        if canMove then
            self.y = self.y + self.speed * dt
        end
    end

    table.insert(enemies, enemy)

end

function update(dt)

    for _, v in ipairs(enemies) do
        v:update(dt)
    end

    for i = #enemies, 1, -1 do
        if enemies[i].dead then
            table.remove(enemies, i)
        end
    end
    
    timer = timer - dt
    if timer <= 0 then
        local x = columns[math.random(1,5)]
        spawnEnemy(x)
        timer = spawnInterval
    end

end

function draw()

    for _, v in ipairs(enemies) do
        love.graphics.setColor(v.color.r, v.color.g, v.color.b, v.health / v.maxHealth)
        love.graphics.circle("fill", v.x, v.y, 30)
    end

end

systems.addUpdateFunction(update)
systems.addDrawFunction(draw, 2)