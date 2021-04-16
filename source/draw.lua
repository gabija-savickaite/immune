local systems = require("source/systems")

return function(dt)

    for _, v in ipairs(systems.draw) do
        v(dt)
    end
    
end