inventory = {}
itemSelected = nil

local systems = require("source/systems")

function draw()
    
    for _, v in ipairs(inventory) do
        love.graphics.setColor(v.color.r, v.color.g, v.color.b)
        love.graphics.circle("fill", v.x, v.y, v.radius)
    end

    if itemSelected ~= nil then
        love.graphics.setColor(itemSelected.color.r, itemSelected.color.g, itemSelected.color.b)
        love.graphics.circle("fill", itemSelected.x, itemSelected.y, itemSelected.radius)
    end

end

function onPress(x, y)

    for i, v in ipairs(inventory) do
        if distance(v.x, v.y, x, y) < 30 then
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

        for _, v in ipairs(towerPositions) do
            if math.abs(x - v.x) < squareSide / 2 and math.abs(y - v.y) < squareSide / 2 and v.occupied == false then
                spawnTower(v.x, v.y, itemSelected.type)
                v.occupied = true
            end
        end

        itemSelected = nil
    end

end

function populateInventory()
    
    for i = 1, #gameState.inventory do

        if gameState.inventory[i].obtained then
            addToInventory(inventoryPositions[i].x, inventoryPositions[i].y, gameState.inventory[i].type)
        end
        
    end

end

function addToInventory(x, y, type)

    table.insert(inventory, getTowerModel(x, y, type))

end

systems.addDrawFunction(draw, 5)