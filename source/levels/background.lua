background = {}

function background:draw()

    love.graphics.setBackgroundColor(1, 1, 1)
    love.graphics.setColor(0, 0, 0)

    for _, v in ipairs(getGridLines()) do
        love.graphics.line(v.x1, v.y1, v.x2, v.y2)
    end
  
end

function getGridLines()

    local lines = {}

    for i = 1, 4 do
        local line = {}
        line.x1 = squareSide * i
        line.y1 = 0
        line.x2 = squareSide * i
        line.y2 = love.graphics.getHeight() - squareSide
        table.insert(lines, line)
    end

    for i = love.graphics.getHeight(), 0, -squareSide do
        if i ~= love.graphics.getHeight() then
            local line = {}
            line.x1 = 0
            line.y1 = i
            line.x2 = love.graphics.getWidth()
            line.y2 = i
            table.insert(lines, line)
        end
    end

    return lines

end