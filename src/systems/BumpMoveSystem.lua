local BumpMoveSystem = tiny.processingSystem()

BumpMoveSystem.filter = tiny.requireAll("position", "bumpMotion", "hitbox", "collisions")

function BumpMoveSystem:init(bumpWorld)
    self.bumpWorld = bumpWorld
end

function BumpMoveSystem.bumpFilter(item, other)
    if other.type == "teleport" then return "cross"
    else return "slide" end
end

function BumpMoveSystem:process(e, dt)
    local goalX = e.position.x + e.bumpMotion.x
    local goalY = e.position.y + e.bumpMotion.y
    local actualX, actualY, cols, len = self.bumpWorld:move(e, goalX, goalY, self.bumpFilter)
    e.collisions.list = cols

    if e.position.y ~= actualY then
        -- if the y position changed, we need to re-calculate our draw order
        self.renderSystem.hotmodified = true
    end

    e.position.x = actualX
    e.position.y = actualY
    -- "Consume" bumpMotion
    e.bumpMotion.x = 0
    e.bumpMotion.y = 0
end

return BumpMoveSystem
