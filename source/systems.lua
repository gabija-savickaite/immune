local systems = {}
systems.update = {}
systems.draw = {}

function systems.addDrawFunction(callback, priority)
    systems.draw[priority] = callback
end

function systems.addUpdateFunction(callback)
    table.insert(systems.update, callback)
end

return systems