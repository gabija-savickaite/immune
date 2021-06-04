local systems = require("source/systems")

return function(dt)

    for _, v in pairs(systems.update) do
        v(dt)
    end
    
end
