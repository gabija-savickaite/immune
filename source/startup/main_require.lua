function getGlobals()

    require("source/global/utilities")
    require("source/global/gameState")
    gameStateInit()
    
    require("source/enemies/enemy")
    
    require("source/towers/inventory")
    require("source/towers/positions")
    require("source/towers/tower")
    require("source/towers/towerProj")

    require("source/levels/background")

end