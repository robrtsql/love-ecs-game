local json = require("libs.json")

-- Note that this collision handler system is for triggering scripts in
-- response to collisions. Collision resolution is left to bump.lua.
-- An example of what we would use the collision handler system for is for
-- triggering the script to remove a coin from our system and incrementing
-- the player's score when they touch/collide with that coin.

local CollisionHandlerSystem = tiny.processingSystem()

CollisionHandlerSystem.filter = tiny.requireAll("position", "bumpMotion",
    "hitbox", "collisions")

CollisionHandlerSystem.subsystems = {
    player = require("src.systems.PlayerCollisionHandlerSystem")
}

function CollisionHandlerSystem:process(e, dt)
    if e.tag then
        local subsystem = self.subsystems[e.tag]
        subsystem:process(e, dt, self.gameState)
    end
end

return CollisionHandlerSystem
