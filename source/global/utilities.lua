function distance(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function shallowCopy(object)

    local copy = {}
    for k, v in pairs(object) do
        copy[k] = v
    end

    return copy
    
end