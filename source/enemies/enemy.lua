enemies = {}
local spawnInterval = 1
local timer = 0

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

    enemy.colour = { r = 0, g = 0, b = 0 }
    enemy.radius = 20

    function enemy:update(dt)
        local canMove = true
        for _, t in ipairs(towers) do
            if distance(t.x, t.y, self.x, self.y) < t.radius + self.radius and self.y < t.y then
                canMove = false
                if self.health <= 0 then
                    self.dead = true
                end
                self.cooldown = self.cooldown - dt
                if self.cooldown <= 0 then
                    t.health = t.health - 10
                    if t.health <= 0 then
                        t.dead = true
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

function enemies:update(dt)

    for _, e in ipairs(self) do
        e:update(dt)
    end

    for i=#enemies, 1, -1 do
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

function enemies:draw()

    for _, e in ipairs(self) do
        love.graphics.setColor(e.colour.r, e.colour.g, e.colour.b, e.health / e.maxHealth)
        love.graphics.circle("fill", e.x, e.y, 30)
    end

end