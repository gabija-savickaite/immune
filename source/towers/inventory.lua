inventory = {}
itemSelected = nil

function inventory:draw()
    
    for _, t in ipairs(self) do
        love.graphics.setColor(t.colour.r, t.colour.g, t.colour.b)
        love.graphics.circle("fill", t.x, t.y, t.radius)
    end

    if itemSelected ~= nil then
        love.graphics.setColor(itemSelected.colour.r, itemSelected.colour.g, itemSelected.colour.b)
        love.graphics.circle("fill", itemSelected.x, itemSelected.y, itemSelected.radius)
    end

end

function onPress(x, y)
    for i,t in ipairs(inventory) do
        if distance(t.x, t.y, x, y) < 30 then
            itemSelected = shallowCopy(inventory[i])
        end
    end
end

function onDrag(x, y)
    if itemSelected ~= nil then
        itemSelected.x = x
        itemSelected.y = y
    end
end

function onRelease(x, y)
    if itemSelected ~= nil then
        for i,p in ipairs(towerPositions) do
            if math.abs(x - p.x) < squareSide / 2 and math.abs(y - p.y) < squareSide / 2 and p.occupied == false then
                spawnTower(p.x, p.y, itemSelected.type)
                p.occupied = true
            end
        end
        itemSelected = nil
    end
end

function populateInventory()
    
    for i=1, #gameState.inventory, 1 do
        if gameState.inventory[i].obtained then
            addToInventory(inventoryPositions[i].x, inventoryPositions[i].y, gameState.inventory[i].type)
        end
    end

end

function addToInventory(x, y, type)

    table.insert(inventory, getTowerModel(x, y, type))

end