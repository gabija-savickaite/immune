towerProjectiles = {}
local systems = require("source/systems")

function spawnTowerProj(x, y, tower)

    local proj = {}
    proj.x = x
    proj.y = y
    proj.dead = false
    proj.radius = 3
    proj.damage = 20
    proj.speed = 300
    proj.colour = tower.colour

    function proj:update(dt)

        self.y = self.y - self.speed * dt
  
        for _, e in ipairs(enemies) do
            if distance(e.x, e.y, self.x, self.y) < e.radius + self.radius then
                e.health = e.health - self.damage
                self.dead = true
                if e.health <= 0 then
                    e.dead = true
                end
            end
        end
    end

    table.insert(towerProjectiles, proj)
  
end

function update(dt)

    for _, s in ipairs(towerProjectiles) do
      s:update(dt)
    end
  
    for i=#towerProjectiles,1,-1 do

        local proj = towerProjectiles[i]
    
        if proj.dead then
          table.remove(towerProjectiles, i)
        end

    end

end

function draw()

    for _, p in ipairs(towerProjectiles) do
        love.graphics.setColor(p.colour.r, p.colour.g, p.colour.b)
        love.graphics.circle("fill", p.x, p.y, 4)
    end
  
end

systems.addUpdateFunction(update)
systems.addDrawFunction(draw, 3)