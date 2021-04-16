towerPositions = {}
inventoryPositions = {}
columns = {}

squareSide = love.graphics.getWidth() / 5

function calculatePositions()

    for i=1, 5, 1 do
        columns[i] = squareSide * i - squareSide / 2
    end

    for i=love.graphics.getHeight(), 0, -squareSide do
        if i ~= love.graphics.getHeight() then
            if i - squareSide > 0 then
                for j=1, 5, 1 do
                    local position = {}
                    position.x = columns[j]
                    position.y = i - squareSide / 2
                    position.occupied = false
                    table.insert(towerPositions, position)
                end
            end
        else
            for j=1, 5, 1 do
                local position = {}
                position.x = columns[j]
                position.y = i - squareSide / 2
                position.occupied = false
                table.insert(inventoryPositions, position)
            end
        end
    end
end