towerProjectiles = {}
local systems = require("source/systems")

function spawnTowerProj(x, y, tower)

    local proj = {}
    proj.x = x
    proj.y = y
    proj.dead = false
    proj.radius = 4
    proj.damage = 20
    proj.speed = 300
    proj.color = tower.color

    function proj:update(dt)

        self.y = self.y - self.speed * dt
  
        for _, v in ipairs(enemies) do
            if distance(v.x, v.y, self.x, self.y) < v.radius + self.radius then
                v.health = v.health - self.damage
                self.dead = true
                if v.health <= 0 then
                    v.dead = true
                end
            end
        end
    end

    table.insert(towerProjectiles, proj)
  
end

function update(dt)

    for _, v in ipairs(towerProjectiles) do
      v:update(dt)
    end
  
    for i = #towerProjectiles, 1, -1 do

        local proj = towerProjectiles[i]
    
        if proj.dead then
          table.remove(towerProjectiles, i)
        end

    end

end

function draw()

    for _, v in ipairs(towerProjectiles) do
        love.graphics.setColor(v.color.r, v.color.g, v.color.b)
        love.graphics.circle("fill", v.x, v.y, v.radius)
    end
  
end

systems.addUpdateFunction(update)
systems.addDrawFunction(draw, 3)