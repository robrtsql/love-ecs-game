local TileMapSystem = tiny.processingSystem()

TileMapSystem.filter = tiny.requireAll("tileMap")

function TileMapSystem:process(e, dt)
    local tileMap = e.tileMap
end

return TileMapSystem
