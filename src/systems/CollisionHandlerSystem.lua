-- Note that this collision handler system is for triggering scripts in
-- response to collisions. Collision resolution is left to bump.lua.
-- An example of what we would use the collision handler system for is for
-- triggering the script to remove a coin from our system and incrementing
-- the player's score when they touch/collide with that coin.

local CollisionHandlerSystem = tiny.processingSystem()

CollisionHandlerSystem.filter = tiny.requireAll("position", "bumpMotion", "hitbox", "collisions")

function CollisionHandlerSystem:process(e, dt)
    if e.collisions.list then
        for _, collision in ipairs(e.collisions.list) do

        end
    end
end

return CollisionHandlerSystem
