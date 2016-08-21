local BumpMoveSystem = tiny.processingSystem()

BumpMoveSystem.filter = tiny.requireAll("position", "bumpMotion")

function BumpMoveSystem:init(bumpWorld)
    self.bumpWorld = bumpWorld
end

function BumpMoveSystem:process(e, dt)
    local goalX = e.position.x + e.bumpMotion.x
    local goalY = e.position.y + e.bumpMotion.y
    local actualX, actualY, cols, len = self.bumpWorld:move(e, goalX, goalY)
    e.position.x = actualX
    e.position.y = actualY
    -- "Consume" bumpMotion
    e.bumpMotion.x = 0
    e.bumpMotion.y = 0
end

return BumpMoveSystem
