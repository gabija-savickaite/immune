local systems = {}
systems.update = {}
systems.draw = {}

local systemsMetatable = {}

local function addUpdateFunction(callback)
    table.insert(systems.update, callback)
end

local function addDrawFunction(callback, priority)
    systems.draw[priority] = callback
end

systemsMetatable.__index = {}
systemsMetatable.__index.addUpdateFunction = addUpdateFunction
systemsMetatable.__index.addDrawFunction = addDrawFunction

setmetatable(systems, systemsMetatable)

return systems