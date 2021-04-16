gameState = {}
gameState.inventory = {}

function gameStateInit()

    table.insert(gameState.inventory, { type = "marrow", obtained = true })
    table.insert(gameState.inventory, { type = "skin", obtained = true })
    table.insert(gameState.inventory, { type = "fever", obtained = true })
    table.insert(gameState.inventory, { type = "thymus", obtained = false })
    table.insert(gameState.inventory, { type = "phagocyte", obtained = false })

end