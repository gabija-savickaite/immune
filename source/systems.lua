local systems = {}
systems.update = {}
systems.draw = {}

function systems.addDrawFunction(callback, priority)

    local index, value = 1, { Priority = priority, Callback = callback }

    for i, v in ipairs(systems.draw) do
        if v.Priority > priority then
            index = i
            break
        end
    end
    
    table.insert(systems.draw, index, value)

end

function systems.addUpdateFunction(callback)
    table.insert(systems.update, callback)
end

return systems