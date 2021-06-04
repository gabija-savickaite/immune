gameState = {}
gameState.inventory = {}

State = {
    Gameplay = 1,
    GameOver = 2,
    MainMenu = 3,
    TitleScreen = 4,
}

function gameStateInit()

    -- 1: gameplay
    -- 2: game over
    -- 3: main menu
    -- 4: title screen
    gameState.state = State.Gameplay

    table.insert(gameState.inventory, { type = "marrow", obtained = true })
    table.insert(gameState.inventory, { type = "skin", obtained = true })
    table.insert(gameState.inventory, { type = "fever", obtained = true })
    table.insert(gameState.inventory, { type = "thymus", obtained = false })
    table.insert(gameState.inventory, { type = "phagocyte", obtained = false })

end